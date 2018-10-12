#!/usr/bin/env python
# _#_ coding:utf-8 _*_

from celery import task

from CMDB.model.server_models import scan_conf_ip
from CMDB.views.server.scan_lib.nmapdev import NmapDev

def do_scan_host(port_list,ip_duan,black_list,sshpass_list):
    '''

    :return:
    '''
    nmap_item=NmapDev()
    sship_list,host_list,unkown_list = nmap_item.nmap_sship(port_list,ip_duan,black_list)

    #sship_list：存在ssh端口的主机,host_list:所有主主机IP，unkown_list 在host中，不在 sship_list 中的 未知主机IP
    #存在ssh端口登陆与否的设备返回

    canlogin_list,notlogin_list = nmap_item.try_pass_login(sship_list,sshpass_list,syscmd_list)
    return  unkown_list
    #TODO 提取扫描的网段地址
    # nets=scan_conf_ip.objects.values('nets').all()
    # # TODO 执行扫描
    # nmap_item=NmapDev()
    # for ips in nets:
    #     allip=nmap_item.nmap_allip(ips)



