#-*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse
from CMDB.model.yewutree_model import YewuTreeMptt as YewuTree

import json

def yewu_tree(request):
    yewu=YewuTree.objects.all()

    return  render(request, 'cmdb/yewutree/yewu_base.html',locals())

def yewu_huizong(request):
    return render(request, 'cmdb/yewutree/yewu_huizong.html')

def yewu_server(request):
    return render(request, 'cmdb/yewutree/yewu_server.html')


def yewu_mysql(request):
    return render(request, 'cmdb/yewutree/yewu_mysql.html')

def yewu_oracle(request):
    return render(request, 'cmdb/yewutree/yewu_oracle.html')