#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render
from django.http.response import JsonResponse
from CMDB.model.idc_models import Idc
from django.contrib.auth.models import User
from CMDB.model.server_models import Host,Host_fail

def xunihost_show(request):

    return  render(request,'cmdb/servers/virtual_host_list.html',locals())

def xunihost_add(request):
    if request.method=='GET':
        idc=Idc.objects.all()
        operators=User.objects.all()
        return  render(request,'cmdb/servers/virtual_host_add.html',locals())

    if request.method=="POST":

        '''新增加数据，这个IP 一定是在hostfail 中，并且不再 host 中'''

        ip=request.POST['ip']
        hostname=request.POST['hostname']
        hostserver=request.POST['hostserver']
        system_type=request.POST['system_type']
        username=request.POST['username']
        passwd=request.POST['passwd']
        idc=request.POST['idc']
        vendor=request.POST['vendor']
        ssh_status=request.POST['ssh_status']
        try:
            hostfail=Host_fail.objects.filter(ip__exact=ip)
            if hostfail.exists():
                try:
                    host_check=Host.objects.filter(ip__exact=ip)
                    if not host_check.exists():
                        host=Host()
                        host.hostname=hostname
                        host.ip=ip
                        host.hostserver=hostserver
                        host.username=username
                        host.passwd=passwd
                        host.idc_id=idc
                        host.vendor=vendor
                        host.ssh_status=ssh_status
                        host.asset_type=u'虚拟机'
                        host.save()
                        hostfail.delete()
                        json_data= {'code': 0, 'msg': '主机添加成功，登陆失败记录已经删除'}
                        return JsonResponse(json_data)
                    else:
                        json_data = {'code': 0, 'msg': '主机添加失败，确定ip是否已经在主机表中'}
                        return JsonResponse(json_data)

                except Exception as e:
                    print e
                    json_data = {'code': 0, 'msg': '主机添加失败，请看信息'+e}
                    return JsonResponse(json_data)
            else:

                json_data = {'code': 0, 'msg': '主机添加失败，确定ip是在登陆失败表中'}
                return JsonResponse(json_data)

        except Exception as e:
            print  e



def xunihost_edit(request):

    if request.method == 'GET':
        hostid=request.GET['id']
        host=Host.objects.get(id=hostid)
        idc = Idc.objects.all()
        operators = User.objects.all()
        return render(request, 'cmdb/servers/virtual_host_edit.html', locals())

    if request.method == "POST":

        '''新增加数据，这个IP 一定是在hostfail 中，并且不再 host 中'''
        id=request.POST['id']

        onlinedate = request.POST['up_date']
        hostserver = request.POST['hostserver']
        useuser = request.POST['useuser']
        purpose = request.POST['purpose']
        idc = request.POST['idc']
        ssh_status = request.POST['ssh_status']
        try:
                    host = Host.objects.get(id=id)

                    host.onlinedate = onlinedate
                    host.useuser = useuser
                    host.purpose = purpose
                    host.idc_id = idc
                    host.ssh_status = ssh_status
                    host.save()
                    json_data = {'code': 0, 'msg': '主机编辑成功'}
                    return JsonResponse(json_data)


        except Exception as e:
                 print e
                 json_data = {'code': 0, 'msg': '主机编辑失败，请看信息' + e}
                 return JsonResponse(json_data)


def xunihost_detail(request):
    id=request.GET['id']
    host=Host.objects.get(id=id)
    network_cards=host.networkcard_assets_set.all()
    return render(request,'cmdb/servers/virtual_host_detail.html',locals())

