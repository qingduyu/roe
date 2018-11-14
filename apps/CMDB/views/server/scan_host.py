#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render
from django.http import JsonResponse
from CMDB.model.server_models import Host,ASSET_TYPE
from CMDB.model.server_models import scan_conf_ip,scan_host_conf
from CMDB.tasks import do_scan_host


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
        ip_duans=scan_host_conf.objects.all()
        # ports=scan_conf_port.objects.values('port').first()['port'].split(',')
        # ssh_pass=scan_conf_sshpass.objects.values('ssh_pass').first()['ssh_pass'].split(',')

        for ip_duan in ip_duans:
            nets_pass = ip_duan.nets_pass.split(',')
            ssh_pass=ip_duan.ssh_pass.split(',')
            port=ip_duan.port.split(',')
            try:
                do_scan_host.delay(list(port),ip_duan.nets,list(nets_pass),list(ssh_pass))
            except Exception as e:
                print(e)


        json_data = {'code': 200, 'msg': '主机扫描完成'}
        return JsonResponse(json_data,safe=False)







def scan_host_edit(request,id):
    data=Host.objects.get(id=id)
    asset_type = ASSET_TYPE
    return render(request,'cmdb/servers/scan_host_edit.html',locals())







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
