#!/usr/bin/env python
# _#_ coding:utf-8 _*_

#扫描配置

from django.shortcuts import render


def suzhuhost_show(request):
    return  render(request,'cmdb/servers/suzhu_servers_list.html',locals())