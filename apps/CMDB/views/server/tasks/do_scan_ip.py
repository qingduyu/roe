#!/usr/bin/env python
# _#_ coding:utf-8 _*_

from celery import task

from CMDB.model.server_models import scan_conf_ip
from CMDB.views.server.scan_lib.nmapdev import NmapDev
def scan_ip():
    '''

    :return:
    '''
    #TODO 提取扫描的网段地址
    nets=scan_conf_ip.objects.values('nets').all()
    # TODO 执行扫描
    nmap_item=NmapDev()
    for ips in nets:
        allip=nmap_item.nmap_allip(ips)




