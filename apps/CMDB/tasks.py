#!/usr/bin/env python
# _#_ coding:utf-8 _*_

from celery import task

from CMDB.model.server_models import scan_conf_ip
from CMDB.views.server.scan_lib.nmapdev import NmapDev
from CMDB.model.server_models import Host, Host_fail
from utils.encrpt import prpcrypt
import  math



from subprocess import Popen, PIPE


def deploy_key(ip, ssh_port, ssh_pwd):
    cmd = "/usr/bin/expect /opt/sshkey_deploy {} {} {}".format(ip,ssh_port, ssh_pwd)
    p = Popen(cmd, stdout=PIPE, stderr=PIPE, shell=True)
    data = p.communicate()
    return data



@task
def do_scan_ip(ip_duan):
    '''

    :return:
    '''
    nmap_item=NmapDev()
    allip=nmap_item.nmap_allip(ip_duan)
    return  allip
    #TODO 提取扫描的网段地址
    # nets=scan_conf_ip.objects.values('nets').all()
    # # TODO 执行扫描
    # nmap_item=NmapDev()
    # for ips in nets:
    #     allip=nmap_item.nmap_allip(ips)









@task
def do_scan_host(port_list,ip_duan,black_list,sshpass_list):
    '''

    :return:
    '''
    nmap_item=NmapDev()
    sship_list,host_list,unkown_list = nmap_item.nmap_sship(port_list,ip_duan,black_list)

    #sship_list：存在ssh端口的主机,host_list:所有主主机IP，unkown_list 在host中，不在 sship_list 中的 未知主机IP
    #存在ssh端口登陆与否的设备返回
    syscmd_list = ["cat /etc/issue",
                   "cat /etc/redhat-release",
                   "hostname",
                   "cat /sys/class/net/[^vtlsb]*/address||esxcfg-vmknic -l|awk '{print $8}'|grep ':'",
                   "dmidecode -s system-serial-number",
                   "dmidecode -s system-manufacturer",
                   "dmidecode -s system-product-name",
                   "grep 'model name' /proc/cpuinfo |uniq |awk -F : '{print $2}' |sed 's/^[ \t]*//g'",  # cpuÐÍºÅ
                   "grep 'processor' /proc/cpuinfo |sort |uniq |wc -l",  # cpu ºËÊý
                   "cat /proc/meminfo |grep 'MemTotal' |awk -F : '{print $2/1048576}' |sed 's/^[ \t]*//g'"
                   ]

    canlogin_list,notlogin_list = nmap_item.try_pass_login(sship_list,sshpass_list,syscmd_list)
    login_host_info = dict()
    crpt_do = prpcrypt()
    if canlogin_list:
        for item in canlogin_list:
            mathine_t = canlogin_list[item][7] if canlogin_list[item][7] else u"未知(需要安装dmidecode工具)"
            crpt_pass = crpt_do.encrypt(canlogin_list[item][1]) if canlogin_list[item][1] else crpt_do.encrypt('')
            print(item)
            tempdict = dict()
            tempdict['ip'] = item
            tempdict['ssh_port'] = str(canlogin_list[item][0])
            tempdict['ssh_passwd'] = crpt_pass
            tempdict['ssh_user'] = str(canlogin_list[item][2])
            tempdict['system_ver'] = canlogin_list[item][3]
            tempdict['hostname'] = canlogin_list[item][4]
            tempdict['machine_type'] = mathine_t
            tempdict['sn'] = canlogin_list[item][6]
            tempdict['cpu_model'] = canlogin_list[item][8]
            tempdict['cpu_num'] = canlogin_list[item][9]
            tempdict['mem_total'] = int(math.ceil(float(canlogin_list[item][10])))


            try:  # 如果主机存在，并且，扫描的IP 在IP 资源表中，则主机的IP_others 增加IP
                # ipsource=IpSource.objects.get(ip=ip)
                host = Host.objects.get(sn=tempdict['sn'])
                host.hostname = tempdict['hostname']
                host.system_type = tempdict['system_ver']
                host.port = tempdict['ssh_port']
                host.username = tempdict['ssh_user']
                host.passwd = tempdict['ssh_passwd']

                # host.disk=disk
                host.status = '1'
                host.ssh_status = '1'
                host.vendor = tempdict['machine_type']
                if item[0:3] == '172':
                    host.idc_id = '1'
                elif item[0:3] == '10.':
                    host.idc_id = '2'
                # if tempdict['machine_type'][0:6] == 'XenHVM':
                #     host.asset_type = u'虚拟机'
                ip_temp = host.ip_other.split(',')
                tem = 0  # 如果 ip other 有这个ip 就是已经保存了这个IP，忽略，增加，如过没有则保存
                for i in ip_temp:
                    if i == item:
                        tem = 1
                if tem == 0:
                    host.ip_other = item + ',' + host.ip_other
                host.save()
            except Exception as msg:  # 如果找不到这个主机就认为是新的，就去部署ansible
                print(msg)
                host = Host()
                # ssh_pwd =  tempdict['ssh_passwd']
                # data = deploy_key(ip, int(ssh_port), ssh_pwd)
                host.hostname = tempdict['hostname']
                host.system_type = tempdict['system_ver']
                host.port = tempdict['ssh_port']
                host.username = tempdict['ssh_user']
                host.passwd = tempdict['ssh_passwd']
                host.sn = tempdict['sn']
                # host.disk = disk
                host.status = '1'
                host.ssh_status = '1'
                host.vendor = tempdict['machine_type']
                host.ip = tempdict['ip']
                host.ip_other = tempdict['ip']
                if item[0:3] == '172':
                    host.idc_id = '1'
                elif item[0:3] == '10.':
                    host.idc_id = '2'
                # if tempdict['machine_type'][0:6] == 'XenHVM':
                #     host.asset_type = '虚拟机'
                host.save()

    if unkown_list:
        for item in unkown_list:
            tempdict = dict()
            tempdict['ip'] = item
            tempdict['is_ssh'] = 0
            tempdict['port'] = ''

            ip = item
            is_active = 1
            try:  # 如果主机ip存在，则设置fail表， 主机已经存在host表 增加 增加IP

                ip_host=Host.objects.filter(ip_other__contains=ip)

                if not ip_host.exists():
                    Host_fail.objects.create(ip=ip, is_ssh=tempdict['is_ssh'], port=tempdict['port'],
                                             is_active=is_active,
                                             is_inhost=False)
                else:
                    is_inhost = False
                    for ips in ip_host:
                        ip_list = ips.ip_other.split(',')  # 因为总是出现会过包含主机的信息
                        for ipi in ip_list:
                          if ipi == ip:
                            is_inhost = True
                            break
                        if is_inhost:
                          break

                    if not is_inhost:
                       Host_fail.objects.create(ip=ip, is_ssh=tempdict['is_ssh'], port=tempdict['port'],
                                                       is_inhost=is_inhost)

            except Exception as e:
                print(e)

    if notlogin_list:
        for item in notlogin_list:
            tempdict = dict()
            tempdict['ip'] = item
            tempdict['is_ssh'] = 1
            tempdict['port'] = notlogin_list[item]
            ip = item
            is_active = 1
            try:  # 如果主机ip存在，则设置fail表， 主机已经存在host表 增加 增加IP
                ip_host = Host.objects.filter(ip_other__contains=ip)
                if not ip_host.exists():
                    Host_fail.objects.create(ip=ip, is_ssh=tempdict['is_ssh'], port=tempdict['port'],
                                             is_active=is_active,
                                             is_inhost=False)
                else:
                    is_inhost=False
                    for ips in ip_host:
                      ip_list = ips.ip_other.split(',')   #因为总是出现会过包含主机的信息
                      for ipi in ip_list:
                        if ipi == ip:
                            is_inhost = True
                            break
                      if is_inhost:
                          break

                    if not is_inhost:
                         Host_fail.objects.update_or_create(ip=ip, is_ssh=tempdict['is_ssh'], port=tempdict['port'],
                                                                is_inhost=is_inhost)


            except Exception as e:
                print(e)

    return
