#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render,HttpResponse
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response
from CMDB.model.server_models import Host
from CMDB.model.server_models import IpSource,scan_conf_ip,scan_conf_port,scan_conf_sshpass
from CMDB.views.server.tasks.do_scan_host import do_scan_host
from CMDB.views.server.tasks.deploy_key import deploy_key


def  scan_host(request):
    '''
    主机扫描的界面展示
    :return:
    '''
    if request.method=="GET":   #默认查看
        ip_duans= scan_conf_ip.objects.all()
        ipduan=dict()
        for i in ip_duans:
            ipduan['id']=i.id
            ipduan['name']=i.nets
        return render(request, 'cmdb/servers/scan_host.html', locals())
    if request.method=='POST':
        '''进行后台扫描函数'''
        ip_duans=scan_conf_ip.objects.all()
        ports=scan_conf_port.objects.values('port').first()['port'].split(',')
        ssh_pass=scan_conf_sshpass.objects.values('ssh_pass').first()['ssh_pass'].split(',')

        for ip_duan in ip_duans:
            nets_pass = ip_duan.nets_pass.split(',')
            asset_info=do_scan_host(list(ports),ip_duan.nets,list(nets_pass),list(ssh_pass))
        #     for item in asset_info:
        #         print item
        #         ip = item
        #         ssh_port = asset_info[item]['ssh_port']
        #         ssh_user = asset_info[item]['ssh_user']
        #         ssh_passwd = asset_info[item]['ssh_passwd']
        #         sn = asset_info[item]['sn']
        #         system_ver = asset_info[item]['system_ver']
        #         hostname = asset_info[item]['hostname']
        #         ssh_status = asset_info[item]['ssh_status'][0]
        #         ssh_rsa = asset_info[item]['ssh_rsa']
        #         rsa_pass = asset_info[item]['rsa_pass']
        #         vendor = asset_info[item]['machine_type']
        #         cpu_model = asset_info[item]['cpu_model']
        #         cpu_num = asset_info[item]['cpu_num']
        #         memory = asset_info[item]['mem_total']
        #         disk = asset_info[item]['disk']
        #         status = '1'
        #
        #         try:  # 如果主机存在，并且，扫描的IP 在IP 资源表中，则主机的IP_others 增加IP
        #             # ipsource=IpSource.objects.get(ip=ip)
        #             host = Host.objects.get(hostname=hostname)
        #             host.hostname = hostname
        #             host.system_type = system_ver
        #             host.ssh_port = ssh_port
        #             host.ssh_user = ssh_user
        #             host.ssh_passwd = ssh_passwd
        #             host.ssh_rsa = ssh_rsa
        #             host.rsa_pass = rsa_pass
        #             host.sn = sn
        #             host.cpu_model = cpu_model
        #             host.cpu_num = cpu_num
        #             host.memory = memory
        #             # host.disk=disk
        #             host.status = '1'
        #             host.ssh_status = ssh_status
        #             host.vendor = vendor
        #             if ip[0:3] == '172':
        #                 host.idc_id = '1'
        #             elif ip[0:3] == '10.':
        #                 host.idc_id = '2'
        #             if vendor[0:6] == 'XenHVM':
        #                 host.asset_type = '2'
        #             ip_temp = host.ip_other.split(',')
        #             tem = 0  # 如果 ip other 有这个ip 就是已经保存了这个IP，忽略，增加，如过没有则保存
        #             for i in ip_temp:
        #                 if i == ip:
        #                     tem = 1
        #             if tem == 0:
        #                 host.ip_other = ip + ',' + host.ip_other
        #             host.save()
        #         except Exception as msg:  # 如果找不到这个主机就认为是新的，就去部署ansible
        #             print(msg)
        #             host = Host()
        #             ssh_pwd = ssh_passwd
        #             data = deploy_key(ip, int(ssh_port), ssh_pwd)
        #             host.hostname = hostname
        #             host.system_type = system_ver
        #             host.ssh_port = ssh_port
        #             host.ssh_user = ssh_user
        #             host.ssh_passwd = ssh_passwd
        #             host.ssh_rsa = ssh_rsa
        #             host.rsa_pass = rsa_pass
        #             host.sn = sn
        #             host.cpu_model = cpu_model
        #             host.cpu_num = cpu_num
        #             host.memory = memory
        #             host.status = '1'
        #             host.ssh_status = ssh_status
        #             host.vendor = vendor
        #             host.ip = ip
        #             host.ip_other = ip
        #             if ip[0:3] == '172':
        #                 host.idc_id = '1'
        #             elif ip[0:3] == '10.':
        #                 host.idc_id = '2'
        #             if vendor[0:5] == 'XenHVM':
        #                 host.asset_type = '2'
        #             host.save()

        json_data = {'code': 200, 'msg': '主机扫描完成'}
        return Response(json_data,content_type="application/json",status=200)







def scan_host_edit(request):
    return True







#
#
# def main():
#     '''
#  开始扫描所有网段
#     :return:
#     '''
#     f=open('conf/scanhosts.yaml','r')
#     yamlfile=f.read()
#     s_conf = yaml.load(yamlfile)
#     print (type(s_conf))
#     s_nets = s_conf['hostsinfo']['nets']
#     s_netpass = s_conf['hostsinfo']['netpass']
#     s_ports = s_conf['hostsinfo']['ports']
#     s_pass = s_conf['hostsinfo']['ssh_pass']
#     s_cmds = s_conf['hostsinfo']['syscmd_list']
#     s_keys = s_conf['hostsinfo']['ssh_key_file']
#     s_blacks = s_conf['hostsinfo']['black_list']
#     server_ip = s_conf["server"]
#     token=s_conf['token']
#
#
#     '''
#     ËùÓÐÍø¶Î¿ªÊ¼É¨Ãè
#     '''
#     for nmap_type in s_nets:
#         allip_dict,host_faillogin_dict,host_login_dict = snmp_begin(nmap_type,s_netpass,s_ports,s_pass,s_keys,s_cmds,s_blacks)
#         allip_dict['token']=token
#         allip_info = json.dumps(allip_dict)
#         post_data("http://{0}/cmdb/scanip_api".format(server_ip), allip_info)
#         host_login_dict['token']=token
#         host_asset_info= json.dumps(host_login_dict)
#         post_data("http://{0}/cmdb/scanhost_api".format(server_ip), host_asset_info)
#         host_faillogin_dict['token']=token
#         host_fail_info= json.dumps(host_faillogin_dict)
#         post_data("http://{0}/cmdb/host_fail_api".format(server_ip), host_fail_info)
#
#     endtime = datetime.datetime.now()
#     totaltime = (endtime - starttime).seconds
#
#     logging.info("{Finish:Use time %s s}"%totaltime)
#     print "{Finish:Use time %s s}"%totaltime
