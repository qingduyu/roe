# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import viewsets, permissions
from rest_framework import status

from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required


from rest_framework.views import APIView
from django.http.response import JsonResponse,Http404
from rest_framework.parsers import JSONParser
from CMDB.model.server_models import Host,Host_fail

from CMDB.serialize.host_serializers import Host_Serializer,Host_read_Serializer
from CMDB.model.yewutree_model import YewuTreeMptt

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



def get_treehost(request,id):
    if request.method=="GET":
        # hostid=request.POST['hostid']
        hostid=id

        host=Host.objects.filter(tree_id__id=hostid)
        data=[]
        for i in host:
            temp={}
            temp['name'] = "("+i.ip+ ")"+' '+ i.hostname
            temp['value'] = i.id
            data.append(temp)
        jsonhost=demjson.encode(data)

        json_data = {'code': '0', 'msg': 'success'}
        json_data['data'] = jsonhost
        return JsonResponse(json_data)


# @api_view(['GET', 'GET'])
# def get_treehost(request,id):
#     if request.method=="GET":
#         # hostid=request.POST['hostid']
#         hostid=id
#
#         host=Host.objects.filter(tree_id__id=hostid)
#         json_host=Host_read_Serializer(host,many=True)
#
#         json_data = {'code': '0', 'msg': 'success'}
#         json_data['data'] = json_host.data
#         return Response(json_data)