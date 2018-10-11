#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render,HttpResponse
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response

from CMDB.model.server_models import scan_conf_ip,scan_conf_cmd,scan_conf_keyfile,scan_conf_port,scan_conf_sshpass

@login_required()
def scan_host_conf(request):
    ips=scan_conf_ip.objects.all()
    keyfile=scan_conf_keyfile.objects.values('keys').first()
    ports=scan_conf_port.objects.first()
    sshpass=scan_conf_sshpass.objects.first()

    return render(request, 'cmdb/servers/scan_conf_list.html',locals())


def scan_host_conf_upate(request):
    if request.method == 'POST':
        data=request.data

    json_data = {'code': 500, 'msg': '数据添加失败，请检查数据格式'}
    return JsonResponse(json_data)


def scan_host_ip_add(request):
    if request.method == 'POST':
        data=request.POST
        try:
             scan_conf_ip.objects.create(nets=data['nets'],nets_pass=data['nets_pass'])
             json_data = {'code': 200, 'msg': 'IP地址段添加成功'}
             return JsonResponse(json_data)
        except Exception as e:
            print(e)
            json_data = {'code': 500, 'msg': 'IP地址段添加失败'+e}
            return Response(json_data,content_type="application/json")



    return render(request,'cmdb/servers/scan_conf_ip_add.html')

def scan_host_ip_del(request):

    ip_id = request.GET.get('id', '')

    if ip_id:
        scan_conf_ip.objects.filter(id=ip_id).delete()
    return HttpResponse(u'删除成功')
