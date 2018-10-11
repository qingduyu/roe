# -*- coding:utf-8 -*-

import os
from CMDB.views.server.scan_lib.nmap_all_server import snmp_begin

from CMDB.views.server.scan_lib.postdata import post_data

import yaml
import json
# import sys


def  scanhost():
    '''
    主机扫描的界面展示
    :return:
    '''
















def main():
    '''
 开始扫描所有网段
    :return:
    '''
    f=open('conf/scanhosts.yaml','r')
    yamlfile=f.read()
    s_conf = yaml.load(yamlfile)
    print (type(s_conf))
    s_nets = s_conf['hostsinfo']['nets']
    s_netpass = s_conf['hostsinfo']['netpass']
    s_ports = s_conf['hostsinfo']['ports']
    s_pass = s_conf['hostsinfo']['ssh_pass']
    s_cmds = s_conf['hostsinfo']['syscmd_list']
    s_keys = s_conf['hostsinfo']['ssh_key_file']
    s_blacks = s_conf['hostsinfo']['black_list']
    server_ip = s_conf["server"]
    token=s_conf['token']


    '''
    ËùÓÐÍø¶Î¿ªÊ¼É¨Ãè
    '''
    for nmap_type in s_nets:
        allip_dict,host_faillogin_dict,host_login_dict = snmp_begin(nmap_type,s_netpass,s_ports,s_pass,s_keys,s_cmds,s_blacks)
        allip_dict['token']=token
        allip_info = json.dumps(allip_dict)
        post_data("http://{0}/cmdb/scanip_api".format(server_ip), allip_info)
        host_login_dict['token']=token
        host_asset_info= json.dumps(host_login_dict)
        post_data("http://{0}/cmdb/scanhost_api".format(server_ip), host_asset_info)
        host_faillogin_dict['token']=token
        host_fail_info= json.dumps(host_faillogin_dict)
        post_data("http://{0}/cmdb/host_fail_api".format(server_ip), host_fail_info)

    endtime = datetime.datetime.now()
    totaltime = (endtime - starttime).seconds

    logging.info("{Finish:Use time %s s}"%totaltime)
    print "{Finish:Use time %s s}"%totaltime
