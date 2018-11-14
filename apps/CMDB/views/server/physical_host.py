#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render


def wulihost_show(request):
    return  render(request,'cmdb/servers/physical_host_list.html',locals())