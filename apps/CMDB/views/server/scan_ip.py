#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render
from django.http import JsonResponse

from CMDB.model.server_models import IpSource,scan_host_conf
from CMDB.tasks import do_scan_ip
def scan_ip(request):
    if request.method=="GET":   #默认查看
        ip_duans= scan_host_conf.objects.all().order_by('id')
        ipduan=dict()
        for i in ip_duans:
            ipduan['id']=i.id
            ipduan['name']=i.nets
        return render(request, 'cmdb/servers/scan_ip.html', locals())
    if request.method=='POST':
        '''进行后台扫描函数'''
        ip_duans=scan_host_conf.objects.all()
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
        # return Response(json_data,content_type="application/json") #报错
        # return HttpResponse(json.dumps(json_data),content_type="application/json",status=200)
        return JsonResponse(json_data,safe=False)





def scan_ip_edit(request):
    id=request.GET['id']
    data=IpSource.objects.get(id=id)
    return  render(request,'cmdb/servers/scan_ip_edit.html',locals())