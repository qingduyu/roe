#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render,HttpResponse
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response

from CMDB.model.server_models import IpSource,scan_conf_ip
from CMDB.views.server.tasks.do_scan_ip import do_scan_ip
def scan_ip(request):
    if request.method=="GET":   #默认查看
        ip_duans= scan_conf_ip.objects.all()
        ipduan=dict()
        for i in ip_duans:
            ipduan['id']=i.id
            ipduan['name']=i.nets
        return render(request, 'cmdb/servers/scan_ip.html', locals())
    if request.method=='POST':
        '''进行后台扫描函数'''
        ip_duans=scan_conf_ip.objects.all()
        for ip_duan in ip_duans:
            ips=do_scan_ip(ip_duan.nets)
            for item in ips:
                ip = item
                try:  # 如果主机存在，并且，扫描的IP 在IP 资源表中，则主机的IP_others 增加IP
                    ipsource = IpSource.objects.get(ip=ip)
                except Exception as msg:  # 如果找不到这个ip就认为是新的，就去部署ansible
                    ipsource = IpSource()
                    ipsource.ip = ip
                    ipsource.save()
        json_data = {'code': 200, 'msg': 'ip扫描完成'}
        return Response(json_data,content_type="application/json",status=200)





def scan_ip_edit(request):
    return  True