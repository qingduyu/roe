#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render,HttpResponse
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response

from CMDB.model.server_models import scan_conf_port,scan_conf_sshpass,scan_host_conf
#
# @login_required()
# def scan_host_conf(request):
#     ips=scan_conf_ip.objects.all()
#     keyfile=scan_conf_keyfile.objects.values('keys').first()
#     ports=scan_conf_port.objects.first()
#     sshpass=scan_conf_sshpass.objects.first()
#
#     return render(request, 'cmdb/servers/scan_conf_list.html',locals())

@login_required()
def scan_host_conf_list(request):
    return  render(request,'cmdb/servers/scan_host_conf.html')

def scan_host_conf_add(request):
   return render(request,'cmdb/servers/scan_host_conf_add.html')


def scan_host_conf_edit(request,id):

   data = scan_host_conf.objects.get(id=id)
   return render(request,'cmdb/servers/scan_host_conf_edit.html',locals())
#
# def scan_host_conf_add(request):
#     if request.method == 'POST':
#         data=request.POST
#         try:
#              scan_conf_ip.objects.create(nets=data['nets'],nets_pass=data['nets_pass'])
#              json_data = {'code': 200, 'msg': 'IP地址段添加成功'}
#              return Response(json_data,content_type="application/json")
#         except Exception as e:
#             print(e)
#             json_data = {'code': 500, 'msg': 'IP地址段添加失败'+e}
#             return Response(json_data,content_type="application/json")


def scan_host_conf_upate(request):
    if request.method == 'POST':
        data=request.POST
        Ports=scan_conf_port.objects.first()
        SSH_pass=scan_conf_sshpass.objects.first()
        Ports.port = data['ports']
        SSH_pass.ssh_pass = data['ssh_pass']
        Ports.save()
        SSH_pass.save()

    json_data = {'code': 200, 'msg': '配置完毕'}
    return JsonResponse(json_data)


def scan_host_ip_add(request):
    if request.method == 'POST':
        data=request.POST
        try:
             scan_host_conf.objects.create(nets=data['nets'],nets_pass=data['nets_pass'])
             json_data = {'code': 200, 'msg': 'IP地址段添加成功'}
             return Response(json_data,content_type="application/json")
        except Exception as e:
            print(e)
            json_data = {'code': 500, 'msg': 'IP地址段添加失败'+e}
            return Response(json_data,content_type="application/json")



    return render(request,'cmdb/servers/scan_conf_ip_add.html')

def scan_host_ip_del(request):

    ip_id = request.GET.get('id', '')

    if ip_id:
        scan_host_conf.objects.filter(id=ip_id).delete()
    return HttpResponse(u'删除成功')
