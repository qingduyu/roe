#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render

from django.http.response import JsonResponse
from CMDB.model.idc_models import Idc
from django.contrib.auth.models import User
from CMDB.model.server_models import Host,Host_fail
from utils.encrpt import prpcrypt

def suzhuhost_show(request):
    return  render(request,'cmdb/servers/suzhu_servers_list.html',locals())


def suzhuhost_add(request):
    if request.method == 'GET':
        idc = Idc.objects.all()
        operators = User.objects.all()
        return render(request, 'cmdb/servers/suzhu_servers_add.html', locals())

    if request.method == "POST":

        ip = request.POST['ip']
        hostname = request.POST['hostname']
        port = request.POST['port']
        system_type = request.POST['system_type']
        username = request.POST['username']
        passwd = request.POST['passwd']
        idc = request.POST['idc']

        useuser = request.POST['useuser']
        purpose = request.POST['purpose']
        up_date = request.POST['up_date']
        ssh_status = request.POST['ssh_status']
        try:
            hostfail = Host_fail.objects.filter(ip__exact=ip)
            if hostfail.exists():
                try:
                    host_check = Host.objects.filter(ip__exact=ip)
                    if not host_check.exists():
                        host = Host()
                        pc = prpcrypt()
                        host.hostname = hostname
                        host.ip = ip
                        host.port = port
                        host.username = username
                        host.passwd = pc.encrypt(passwd)
                        host.idc_id = idc
                        host.useuser = useuser
                        host.purpose = purpose
                        host.onlinedate = up_date
                        host.ssh_status = ssh_status
                        host.asset_type = u'虚拟机宿主机'
                        host.save()
                        hostfail.delete()
                        json_data = {'code': 0, 'msg': '主机添加成功，登陆失败记录已经删除'}
                        return JsonResponse(json_data)
                    else:
                        json_data = {'code': 0, 'msg': '主机添加失败，确定ip是否已经在主机表中'}
                        return JsonResponse(json_data)

                except Exception as e:
                    print e
                    json_data = {'code': 0, 'msg': '主机添加失败，请看信息' + e}
                    return JsonResponse(json_data)
            else:

                json_data = {'code': 0, 'msg': '主机添加失败，确定ip是在登陆失败表中'}
                return JsonResponse(json_data)

        except Exception as e:
            print  e


def suzhuhost_edit(request):
    if request.method == 'GET':
        hostid = request.GET['id']
        host = Host.objects.get(id=hostid)
        idc = Idc.objects.all()
        operators = User.objects.all()
        return render(request, 'cmdb/servers/suzhu_servers_edit.html', locals())

    if request.method == "POST":

        '''新增加数据，这个IP 一定是在hostfail 中，并且不再 host 中'''
        id = request.POST['id']
        onlinedate = request.POST['up_date']

        useuser = request.POST['useuser']
        purpose = request.POST['purpose']
        idc = request.POST['idc']
        cabinet = request.POST['cabinet']
        location = request.POST['location']
        uplink_port = request.POST['uplink_port']
        username = request.POST['username']
        passwd = request.POST['passwd']
        port = request.POST['port']
        ssh_status = request.POST['ssh_status']
        try:
            pc = prpcrypt()
            host = Host.objects.get(id=id)
            host.onlinedate = onlinedate
            host.useuser = useuser
            host.purpose = purpose
            host.username = username
            host.passwd = pc.encrypt(passwd)
            host.port = port
            host.idc_id = idc
            host.cabinet = cabinet
            host.location = location
            host.uplink_port = uplink_port
            host.ssh_status = ssh_status
            host.save()
            json_data = {'code': 0, 'msg': '主机编辑成功'}
            return JsonResponse(json_data)

        except Exception as e:
            print e
            json_data = {'code': 0, 'msg': '主机编辑失败，请看信息' + e}
            return JsonResponse(json_data)

def suzhuhost_detail(request):
    id=request.GET['id']
    host=Host.objects.get(id=id)
    network_cards=host.networkcard_assets_set.all()
    return render(request,'cmdb/servers/suzhu_servers_detail.html',locals())