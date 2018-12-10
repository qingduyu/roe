#!/usr/bin/env python
# -*- coding:utf-8 -*-
#########################################################################
# Author:fanglianchao
#mail:flc009@163.com
#========================================================================
import os

PROJECT_ROOT = os.path.realpath(os.path.dirname(__file__))

# import sys


from utils.encrpt import prpcrypt


from CMDB.views.server.scan_lib.nmapdev import NmapDev



import  logging
import  os
dirs = os.path.realpath(os.path.dirname(__file__))
# import sys

def log(log_name, path=None):
    logging.basicConfig(level=logging.INFO,
                format='%(asctime)s %(levelname)s %(message)s',
                datefmt='%Y%m%d %H:%M:%S',
                filename=path+log_name,
                filemode='ab+')
    return logging.basicConfig

log("scanhost.log", dirs+'/')






def snmp_begin(nmap_IP,netpass,ports,password_list,imoocc_key_file,syscmd_list,black_list):
    '''
    ????????
    :param nmap_type: ??IP
    :param ports:
    :param password_list:
    :param imoocc_key_file:
    :param imoocc_key_file:
    :param syscmd_list:
    :param black_list:
    :param s_emails:
    :return:
    '''
    if nmap_IP is None: return False


    nm_item = NmapDev(black_list) #网络扫描设备
    sship_list,host_list,unkown_list = nm_item.nmap_sship(ports,nmap_IP,netpass)
    #sship_list：存在ssh端口的主机,host_list:所有主主机IP，unkown_list 在host中，不在 sship_list 中的 未知主机IP
    #存在ssh端口登陆与否的设备返回

    canlogin_list,notlogin_list = nm_item.try_pass_login(sship_list,password_list,syscmd_list)

    print ("Password Login ...", canlogin_list, notlogin_list)
    logging.info("Use password login:%s,%s" % (canlogin_list, notlogin_list))
    #这里注释key 方式登陆
    #   key_login_list,key_not_login_list = nm_item.try_key_login(notlogin_list,imoocc_key_file,syscmd_list)
    # print ("Key Login ...",key_login_list,key_not_login_list)
    # logging.info("Use key login:%s,%s"%(key_login_list,key_not_login_list))
    #

    login_host_info=dict()

    crpt_do = prpcrypt()

    if canlogin_list:
        for item in canlogin_list:
            mathine_t = canlogin_list[item][7] if canlogin_list[item][7] else u"未知(需要安装dmidecode工具)"
            crpt_pass = crpt_do.encrypt(canlogin_list[item][1]) if canlogin_list[item][1] else crpt_do.encrypt('')
            print(item)
            tempdict=dict()
            tempdict['ip']=item
            tempdict['ssh_port']=str(canlogin_list[item][0])
            tempdict['ssh_passwd']=crpt_pass
            tempdict['ssh_user']=str(canlogin_list[item][2])
            tempdict['ssh_rsa'] = ''
            tempdict['rsa_pass'] = ''
            tempdict['system_ver']=canlogin_list[item][3]
            tempdict['hostname']=canlogin_list[item][4]
            tempdict['machine_type'] = mathine_t
            tempdict['sn']=canlogin_list[item][6]
            tempdict['ssh_status'] = 1,
            tempdict['cpu_model']=canlogin_list[item][8]
            tempdict['cpu_num']=canlogin_list[item][9]
            tempdict['mem_total']=canlogin_list[item][10]
            tempdict['disk']=canlogin_list[item][11]
            login_host_info[item]=tempdict
            # HostLoginifo.objects.update_or_create(ip=item,
            #                                       ssh_port=str(canlogin_list[item][0]),
            #                                       ssh_passwd=crpt_pass,
            #                                       ssh_user=canlogin_list[item][2],
            #                                       ssh_status=1,
            #                                       ssh_type=0,
            #                                       system_ver=canlogin_list[item][3],
            #                                       hostname=canlogin_list[item][4],
            #                                       mac_address=canlogin_list[item][5],
            #                                       sn=canlogin_list[item][6],
            #                                       mathine_type=mathine_t)
    # if key_login_list:
    #     for item in key_login_list:
    #         mathine_t = key_login_list[item][9] if key_login_list[item][9] else u"未知(需要安装dmidecode工具)"
    #         tempdict = dict()
    #         tempdict['ip'] = item
    #         tempdict['ssh_port'] = key_login_list[item][0]
    #         tempdict['ssh_rsa'] = key_login_list[item][0]
    #         tempdict['rsa_pass'] = key_login_list[item][3]
    #         tempdict['ssh_user'] = key_login_list[item][2]
    #         tempdict['ssh_passwd'] = ''
    #         tempdict['system_ver'] = key_login_list[item][5]
    #         tempdict['hostname'] = key_login_list[item][6]
    #         tempdict['sn'] = key_login_list[item][8]
    #         tempdict['machine_type'] = mathine_t
    #         tempdict['ssh_status'] = str(2),
    #         login_host_info[item] = tempdict
    #         # HostLoginifo.objects.update_or_create(ip=item,
    #         #                                       ssh_port=key_login_list[item][0],
    #         #                                       ssh_rsa=key_login_list[item][1],
    #         #                                       ssh_user=key_login_list[item][2],
    #         #                                       rsa_pass=key_login_list[item][3],
    #         #                                       ssh_status=1,
    #         #                                       ssh_type=key_login_list[item][4],
    #         #                                       system_ver=key_login_list[item][5],
    #         #                                       hostname=key_login_list[item][6],
    #         #                                       mac_address=key_login_list[item][7],
    #         #                                       sn=key_login_list[item][8],
    #         #                                       mathine_type=mathine_t)
    # print("login_host_info is ",login_host_info)
    #


    allip=dict()
    if sship_list:
        for item in sship_list:
            tempdict=dict()
            tempdict['ip']=item
            tempdict['is_ssh']=1
            tempdict['port']=sship_list[item]
            allip[item]=tempdict

    host_fail_login=dict()
    if unkown_list:
        for item in unkown_list:
            tempdict=dict()
            tempdict['ip'] = item
            tempdict['is_ssh']=0
            tempdict['port']=''
            allip[item]=tempdict
            host_fail_login[item]=tempdict

    if notlogin_list:
        for item in notlogin_list:
            tempdict = dict()
            tempdict['ip'] = item
            tempdict['is_ssh'] = 1
            tempdict['port'] = notlogin_list[item]
            host_fail_login[item] = tempdict
    return allip,host_fail_login,login_host_info







