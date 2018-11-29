#!/usr/bin/env python
# _#_ coding:utf-8 _*_

import uuid,os,json
from django.http import HttpResponseRedirect,HttpResponse
from django.http.response import JsonResponse,Http404
from rest_framework.response import Response
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from CMDB.model.server_models import Host
from CMDB.model.yewutree_model import YewuTreeMptt
from utils.data.DsRedisOps import DsRedis



import  json
import demjson
from mptt.templatetags.mptt_tags import cache_tree_children
def recursive_node_to_dict(node):
    result = {
        "value" : node.pk,
        "name" : node.name,
        # 'isLast':node.isLast,
        # 'level':node.mptt_level
    }
    children = [recursive_node_to_dict(c) for c in node.get_children()]
    # children=[]
    # for c in node.get_children():
    #     recursive_node_to_dict(c)


    if children:
        result['children'] = children


    return result

def get_jsontree(request):
    root_nodes = cache_tree_children(YewuTreeMptt.objects.all())
    dicts = []
    for n in root_nodes:
        dicts.append(recursive_node_to_dict(n))

    jsonTree = demjson.encode(dicts)
    return JsonResponse({"msg":"success", "code": 0, "data": jsonTree})
    # return JsonResponse({'data': jsonTree})

def exe_modules(request):

    if request.method=='GET':
        # jsonTree2=jsonTree.replace(' ','').replace('\n','')
     #无法同时渲染页面和传递json格式，渲染页面的编码和json编码是不一样的，因此只能通过异步的方式获取json格式数据
        return render(request,'opscontrol/exejobs/exe_modules.html',locals())
    elif request.method=='POST':

        data = request.POST['hosts']


def get_treehost(request):
    if request.method=="GET":
        hostid=request.GET.get('hostid')

        host=Host.objects.filter(tree_id__id=hostid)
        json_host=host.yewu_host

    return JsonResponse({'msg':'success','code':200,'data':json_host})