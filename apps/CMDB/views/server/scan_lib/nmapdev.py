#!/usr/bin/env python
# -*- coding:utf-8 -*-
import  nmap
import time
import telnetlib
import re
import  logging



from  CMDB.views.server.scan_lib.ssh_do import  ssh_do
from CMDB.views.server.scan_lib.trans_format import mac_trans,machine_type_trans,sn_trans,getsysversion,hostname_type_trans,remove_space_line_symbol


class NmapDev(object):
    '''
    扫描指定网段内地址信息
    '''

#传入不做扫描的IP ??
    def __init__(self,black_list=[]):
        self.black_list = black_list
        self.can_login_lst = {}
        self.not_login_lst = {}
        self.can_key_login_lst = {}
        self.key_not_login_lst = {}


    def nmap_allip(self,nmap_IP):
        '''
        返回网段内所有存活的IP
        '''
        nmap_net = "%s.0/24" % nmap_IP
        nm = nmap.PortScanner()
        nm.scan(hosts=nmap_net,arguments = ' -n -sP -PE')
        # nm.scan(hosts=nmap_net,arguments = ' -n -PA -PS')
        hostlist = nm.all_hosts()
        return hostlist

    def nmap_sship(self,ports,nmap_IP,netpass):
        '''
        扫描指定ssh端口是否开启ssh
        :param ports:
        :param port_list:
        :param unkown_list:
        :param nmap_net: 主机网段
        :return:
        '''
        nmap_net = "%s.0/24" % nmap_IP
        netpass_list=[]
        for i in netpass:
            tmp=nmap_IP+'.'+ i
            netpass_list.append(tmp)

        port_list = ports
        nm = nmap.PortScanner()  # 端口扫描对象
        ssh_info = {}
        unkown_list = []
        # 调用扫描方法，参数指定扫描主机的host hosts? nmap 扫描命令行arguments
        nm.scan(hosts=nmap_net, arguments='-n -sP -PE')
        tcp_all_ip = nm.all_hosts() #遍历所有存活主机
        host_list = []
        for ip in tcp_all_ip:  #
            if ip in netpass_list:
                continue
            if nm[ip]['status']['state'] == "up":
                 host_list.append(ip)
                 for port in port_list:
                     try:
                         print ("Scan ip %s ..... Port %s"%(ip,port))
                         port=int(port)
                         tm = telnetlib.Telnet(host=ip,port=port,timeout=4)
                         tm_res = tm.read_until(b"\n",timeout=4).decode()
                         if tm_res:
                             if re.search('ssh',tm_res.lower()):
                                 print (ip,port)
                                 if ip not in self.black_list:
                                     ssh_info[ip]=port
                                     connet = "IP:%s Port:%s Server:%s"%(ip,port,tm_res.lower())
                                     # logging.info("IP:%s Port:%s Server:%s"%(ip,port,tm_res.lower()))
                                     print ("IP:%s Port:%s Server:%s"%(ip,port,tm_res))
                             else:
                                 if ip not in unkown_list and ip not in ssh_info.keys():
                                    unkown_list.append(ip)
                                 # logging.info("Telnet not ssh server:%s,%s,%s"%(ip,port,tm_res))
                                 print ("Open Res.....",ip,port,tm_res)
                         else:
                             if ip not in unkown_list and ip not in ssh_info.keys():
                                unkown_list.append(ip)
                                logging.info("Telnet no data:%s,%s"%(ip,port))
                             print ("Open....",ip,port)
                     except EOFError as e:
                         if ip not in unkown_list and ip not in ssh_info.keys():
                            unkown_list.append(ip)
                         unkown_list.append(ip)

                         print ("Open....",ip,port)
                     except Exception as e:
                         if ip not in unkown_list and ip not in ssh_info.keys():
                            unkown_list.append(ip)

                         print ("error...",(ip,port,e))
        return ssh_info,host_list,list(set(unkown_list))

    def try_pass_login(self,sship_list,password_list,syscmd_list):
        '''
        尝试ssh 用户秘密登陆，获取机器基本信息
        :param sship_list:
        :param password_list:
        :param syscmd_list:
        :return:
        '''
        password_list = password_list
        syscmd_list = syscmd_list
        if isinstance(sship_list, dict):
            ssh_tuple_list = [(ip,port) for ip,port in sship_list.items()]
        elif isinstance(sship_list,list):
            ssh_tuple_list = sship_list
        for ip,port in ssh_tuple_list:
            system_info = ""
            for password in password_list:
                if ip not in self.can_login_lst.keys():
                    login_info = (ip,int(port),'root', password)   #一定是root 扫描
                    doobj = ssh_do(login_info)  #初始化
                    res = doobj.pass_do(login_info,syscmd_list)#密码登陆尝试，并且执行命令
                    if res["status"] == "success":
                        if self.not_login_lst.has_key(ip):
                            self.not_login_lst.pop(ip)
                        sys_hostname =hostname_type_trans(res["hostname"])
                        sys_mac = mac_trans(res["cat /sys/class/net/[^vtlsb]*/address||esxcfg-vmknic -l|awk '{print $8}'|grep ':'"])
                        sys_sn = sn_trans(res["dmidecode -s system-serial-number"])
                        system_info = getsysversion([res["cat /etc/redhat-release"],res["cat /etc/issue"]])
                        machine_type = machine_type_trans(res["dmidecode -s system-manufacturer"] + res["dmidecode -s system-product-name"])
                        cpu_model= remove_space_line_symbol(res["grep 'model name' /proc/cpuinfo |uniq |awk -F : '{print $2}' |sed 's/^[ \t]*//g'"])
                        cpu_num=remove_space_line_symbol(res["grep 'processor' /proc/cpuinfo |sort |uniq |wc -l"])
                        mem_total=remove_space_line_symbol(res["cat /proc/meminfo |grep 'MemTotal' |awk -F : '{print $2/1048576}' |sed 's/^[ \t]*//g'"])

                        print ("ssh login and exec command:%s",res)
                        logging.info("ssh login and exec command:%s",res)
                        self.can_login_lst[ip] = (port,password,'root',system_info,sys_hostname,sys_mac,sys_sn,machine_type,cpu_model,cpu_num,mem_total)
                    elif res["status"] == "failed" and re.search(r"reading SSH protocol banner",res["res"]):

                        print ("IP:%s Connection closed by remote host,Sleep 60 (s).................. "%ip,res)
                        time.sleep(20)
                    else:
                        if ip not in self.not_login_lst.keys() and ip not in self.can_login_lst.keys():
                            self.not_login_lst[ip] = port
                        # print ip,port,password,traceback.print_exc()
        return self.can_login_lst,self.not_login_lst



    def try_key_login(self,sship_list,allkeyfile,syscmd_list):
        '''
        尝试ssh密药登陆 rsa 方式
        :param sship_list:
        :param allkeyfile:
        :param syscmd_list:
        :return:
        '''
        # import traceback
        for ip,port in sship_list.items():
            print ("try key login....",ip,port)
            logging.info("Try ssh key login : %s,%s"%(ip,port))
            keyfile = allkeyfile[0]
            if ip not in self.can_key_login_lst.keys():
                logging.info("Try ssh idrsa key : %s,%s,%s"%(ip,port,keyfile))
                print ('try idrsakey....',ip,port,keyfile)
                login_info = (ip,int(port),'root',keyfile)
                doobj = ssh_do(login_info)
                res = doobj.rsa_do(login_info,syscmd_list)
                if res["status"] == "success":
                    sys_hostname = res["hostname"]
                    system_info = getsysversion([res["cat /etc/issue"],res["cat /etc/redhat-release"]])
                    sys_mac = mac_trans(res["cat /sys/class/net/[^vtlsb]*/address||esxcfg-vmknic -l|awk '{print $8}'|grep ':'"])
                    sys_sn = sn_trans(res["dmidecode -s system-serial-number"])
                    machine_type = machine_type_trans(res["dmidecode -s system-manufacturer"] + res["dmidecode -s system-product-name"])
                    self.can_key_login_lst[ip] = (port,keyfile,"root","",1,system_info,sys_hostname,sys_mac,sys_sn,machine_type)
                # if res["status"] == "failed":
                #         keyfile = allkeyfile[1]
                #         logging.info("try iddsa login...%s,%s,%s"%(ip,port,keyfile))
                #         print ("try iddsa login...",ip,port,keyfile)
                #         login_info = (ip,port,'root', keyfile)
                #         doobj = ssh_do(login_info)
                #         res = doobj.dsa_do(login_info,syscmd_list)
                #         if res["status"] == "success":
                #             sys_hostname = res["hostname"]
                #             system_info = getsysversion([res["cat /etc/issue"],res["cat /etc/redhat-release"]])
                #             sys_mac = mac_trans(res["cat /sys/class/net/[^vtlsb]*/address||esxcfg-vmknic -l|awk '{print $8}'|grep ':'"])
                #             sys_sn = sn_trans(res["dmidecode -s system-serial-number"])
                #             machine_type = machine_type_trans(res["dmidecode -s system-manufacturer"] + res["dmidecode -s system-product-name"])
                #
                #             if self.key_not_login_lst.has_key(ip):self.key_not_login_lst.pop(ip)
                #             self.can_key_login_lst[ip] = (port,keyfile,"root","",2,system_info,sys_hostname,sys_mac,sys_sn,machine_type)
                #         else:
                            # keyfile = allkeyfile[2]
                            # logging.info("try Non-root idrsa login:%s,%s"%(ip,port))
                            # print ("try Non-root idrsa login...",ip,port)
                            # password = '0koooAdmin'
                            # login_info = (ip,port,'imoocc', keyfile,password)
                            # doobj = ssh_do(login_info)
                            # res = doobj.my_rsa_do(login_info,syscmd_list)
                            # if res["status"] == "success":
                            #     sys_hostname = res["hostname"]
                            #     sys_mac = mac_trans(res["cat /sys/class/net/[^vtlsb]*/address||esxcfg-vmknic -l|awk '{print $8}'|grep ':'"])
                            #     system_info = getsysversion([res["cat /etc/issue"],res["cat /etc/redhat-release"]])
                            #     sys_sn = sn_trans(res["dmidecode -s system-serial-number"])
                            #     machine_type = machine_type_trans(res["dmidecode -s system-manufacturer"] + res["dmidecode -s system-product-name"])
                            #     if self.key_not_login_lst.has_key(ip):self.key_not_login_lst.pop(ip)
                            #     self.can_key_login_lst[ip] = (port,keyfile,"root","",3,system_info,sys_hostname,sys_mac,sys_sn,machine_type)
                            # else:
                            #     if ip not in self.key_not_login_lst.keys() and ip not in self.can_key_login_lst.keys():
                            #         self.key_not_login_lst[ip] = (port,keyfile)
        return  self.can_key_login_lst,self.key_not_login_lst