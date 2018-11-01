#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render,HttpResponse
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response
from CMDB.model.server_models import Host
from CMDB.model.server_models import IpSource,scan_conf_ip,scan_host_conf,scan_conf_sshpass
from CMDB.views.server.tasks.do_scan_host import do_scan_host
from CMDB.views.server.tasks.deploy_key import deploy_key


def wulihost_show(request):
    return  render(request,'cmdb/servers/physical_host_list.html',locals())