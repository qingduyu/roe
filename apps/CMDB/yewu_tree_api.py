# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import viewsets, permissions
from rest_framework import status

from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required
from CMDB.model.mysql_modles import MySQLCluster


from rest_framework.views import APIView
from django.http.response import JsonResponse,Http404
from rest_framework.parsers import JSONParser
from CMDB.model.server_models import Host,Host_fail

from CMDB.serialize.host_serializers import Host_Serializer,Host_read_Serializer
from CMDB.serialize.mysql_serializers import MysqlCluster_read_Serializer,MysqlCluster_write_Serializer
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
    '''
    formSelects 用，选择业务线
    :param request:
    :return:
    '''
    root_nodes = cache_tree_children(YewuTreeMptt.objects.all())
    dicts = []
    for n in root_nodes:
        dicts.append(recursive_node_to_dict(n))

    jsonTree = demjson.encode(dicts)
    return JsonResponse({"msg":"success", "code": 0, "data": jsonTree})



def get_treehost(request,id):
    '''
    formselect 用，给丁业务线的id，主机的多选将来也会用来 ，nginx等资产
    :param request:
    :param id:
    :return:
    '''
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


from rest_framework.pagination import PageNumberPagination

class MyPageNumberPagination(PageNumberPagination):
    page_size = 20
    page_size_query_param = "limit"
    page_query_param = 'page'
    max_page_size = 1000


# 分页功能的
class YewuHost_API(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get_object(self, id):
        try:
            return Host.objects.get(id=id)
        except Host.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

        try:
            # id =id
            id= request.query_params['id']
            queryset =  Host.objects.filter(tree_id_id=id)

            ##########以下内容在数据展示列表中不需要修改
            pg = MyPageNumberPagination()  # 实例化分页类
            page_data = pg.paginate_queryset(queryset=queryset, request=request, view=self)  # 根据请求的页码数，对数据进行分页
            s = Host_read_Serializer(instance=page_data, many=True)  # 序列花这个分页数据
            next = pg.get_next_link()  # 获取下一页
            prev = pg.get_previous_link()  # 获取上页
            count = queryset.count()  # 获取数据总数
            json_data = {'code': 0, 'msg': 'success', 'count': count, 'next': next, 'prev': prev}
            json_data['data'] = s.data
            return Response(json_data)
        except Exception as e:
            print  e

    # 增加行条目
    def post(self, request, format=None):
        s = Host_Serializer(data=request.data)
        if s.is_valid():  # 验证
            s.save()
            json_data = {'code': 200, 'msg': '数据添加成功'}
            json_data['data'] = s.data
            return Response(json_data, content_type="application/json")
            # return api_response.JsonResponse(s.data,code=status.HTTP_200_OK,msg='success')
        json_data = {'code': 500, 'msg': '数据添加失败，请检查数据格式'}
        return Response(json_data, content_type="application/json")


    def put(self, request, format=None):
        try:
            data_id = request.data['id']
        except Exception as e:
            print(e)
            json_data = {'code': 500, 'msg': '数据有错误获取不到id'}
            return Response(json_data,status=500)
        else:
            DATA_MODEL = self.get_object(data_id)
            s = Host_Serializer(DATA_MODEL, data=request.data)

            if s.is_valid(raise_exception=True):
                s.save()
                json_data = {'code': 200, 'msg': '更新成功'}
                return Response(json_data)
            json_data = {'code': 500, 'msg': '更新失败'}
            return Response(json_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


    def delete(self, request, format=None):
        try:
            data_id = request.data['id']
        except KeyError as e:
            json_data = {'code': 500, 'msg': '数据有错误获取不到id'}
            return Response(json_data,status=500)
        else:
            try:
                for i in data_id:
                    # if i['status'] == 1: 多级连删除
                    #     work_id = SqlOrder.objects.filter(id=i['id']).first()
                    #     SqlRecord.objects.filter(workid=work_id.work_id).delete()
                    #     SqlOrder.objects.filter(id=i['id']).delete()
                    # else:
                    host=Host.objects.get(id=i)
                    host.tree_id_id=''
                    host.is_pooled=True
                    host.save()
                json_data = {'code': 200, 'msg': '删除关联成功'}
                return Response(json_data)
            except Exception as e:
                json_data = {'code': 500, 'msg': '删除关联失败'+e }
                return Response(json_data)


# 这个是空闲机器
class YewuHost_free_API(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get_object(self, id):
        try:
            return Host.objects.get(id=id)
        except Host.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

        try:
            # id =id

            queryset =  Host.objects.filter(tree_id__isnull=True,is_pooled=True)

            ##########以下内容在数据展示列表中不需要修改
            pg = MyPageNumberPagination()  # 实例化分页类
            page_data = pg.paginate_queryset(queryset=queryset, request=request, view=self)  # 根据请求的页码数，对数据进行分页
            s = Host_read_Serializer(instance=page_data, many=True)  # 序列花这个分页数据
            next = pg.get_next_link()  # 获取下一页
            prev = pg.get_previous_link()  # 获取上页
            count = queryset.count()  # 获取数据总数
            json_data = {'code': 0, 'msg': 'success', 'count': count, 'next': next, 'prev': prev}
            json_data['data'] = s.data
            return Response(json_data)
        except Exception as e:
            print  e

    # 增加行条目
    def post(self, request, format=None):
        s = Host_Serializer(data=request.data)
        if s.is_valid():  # 验证
            s.save()
            json_data = {'code': 200, 'msg': '数据添加成功'}
            json_data['data'] = s.data
            return Response(json_data, content_type="application/json")
            # return api_response.JsonResponse(s.data,code=status.HTTP_200_OK,msg='success')
        json_data = {'code': 500, 'msg': '数据添加失败，请检查数据格式'}
        return Response(json_data, content_type="application/json")


    def put(self, request, format=None):
        try:
            data_id = request.data['id']
        except Exception as e:
            print(e)
            json_data = {'code': 500, 'msg': '数据有错误获取不到id'}
            return Response(json_data,status=500)
        else:
            DATA_MODEL = self.get_object(data_id)
            s = Host_Serializer(DATA_MODEL, data=request.data)

            if s.is_valid(raise_exception=True):
                s.save()
                json_data = {'code': 200, 'msg': '更新成功'}
                return Response(json_data)
            json_data = {'code': 500, 'msg': '更新失败'}
            return Response(json_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


    def delete(self, request, format=None):
        try:
            data_id = request.data['id']
        except KeyError as e:
            json_data = {'code': 500, 'msg': '数据有错误获取不到id'}
            return Response(json_data,status=500)
        else:
            try:
                for i in data_id:
                    # if i['status'] == 1: 多级连删除
                    #     work_id = SqlOrder.objects.filter(id=i['id']).first()
                    #     SqlRecord.objects.filter(workid=work_id.work_id).delete()
                    #     SqlOrder.objects.filter(id=i['id']).delete()
                    # else:
                    host=Host.objects.get(id=i)
                    host.tree_id_id=''
                    host.is_pooled=True
                    host.save()
                json_data = {'code': 200, 'msg': '删除关联成功'}
                return Response(json_data)
            except Exception as e:
                json_data = {'code': 500, 'msg': '删除关联失败'+e }
                return Response(json_data)




# 分页功能的
class YewuMysql_API(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get_object(self, id):
        try:
            return MySQLCluster.objects.get(id=id)
        except Host.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

        try:
            # id =id
            id= request.query_params['id']
            queryset =  MySQLCluster.objects.filter(tree_id_id=id)

            ##########以下内容在数据展示列表中不需要修改
            pg = MyPageNumberPagination()  # 实例化分页类
            page_data = pg.paginate_queryset(queryset=queryset, request=request, view=self)  # 根据请求的页码数，对数据进行分页
            s = MysqlCluster_read_Serializer(instance=page_data, many=True)  # 序列花这个分页数据
            next = pg.get_next_link()  # 获取下一页
            prev = pg.get_previous_link()  # 获取上页
            count = queryset.count()  # 获取数据总数
            json_data = {'code': 0, 'msg': 'success', 'count': count, 'next': next, 'prev': prev}
            json_data['data'] = s.data
            return Response(json_data)
        except Exception as e:
            print  e

    # 增加行条目
    def post(self, request, format=None):
        s = MysqlCluster_write_Serializer(data=request.data)
        if s.is_valid():  # 验证
            s.save()
            json_data = {'code': 200, 'msg': '数据添加成功'}
            json_data['data'] = s.data
            return Response(json_data, content_type="application/json")
            # return api_response.JsonResponse(s.data,code=status.HTTP_200_OK,msg='success')
        json_data = {'code': 500, 'msg': '数据添加失败，请检查数据格式'}
        return Response(json_data, content_type="application/json")


    def put(self, request, format=None):
        try:
            data_id = request.data['id']
        except Exception as e:
            print(e)
            json_data = {'code': 500, 'msg': '数据有错误获取不到id'}
            return Response(json_data,status=500)
        else:
            DATA_MODEL = self.get_object(data_id)
            s = MysqlCluster_write_Serializer(DATA_MODEL, data=request.data)

            if s.is_valid(raise_exception=True):
                s.save()
                json_data = {'code': 200, 'msg': '更新成功'}
                return Response(json_data)
            json_data = {'code': 500, 'msg': '更新失败'}
            return Response(json_data, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


    def delete(self, request, format=None):
        try:
            data_id = request.data['id']
        except KeyError as e:
            json_data = {'code': 500, 'msg': '数据有错误获取不到id'}
            return Response(json_data,status=500)
        else:
            try:
                for i in data_id:
                    # if i['status'] == 1: 多级连删除
                    #     work_id = SqlOrder.objects.filter(id=i['id']).first()
                    #     SqlRecord.objects.filter(workid=work_id.work_id).delete()
                    #     SqlOrder.objects.filter(id=i['id']).delete()
                    # else:
                    host=MySQLCluster.objects.get(id=i)
                    host.tree_id_id=''
                    host.is_pooled = True
                    host.save()
                json_data = {'code': 200, 'msg': '删除关联成功'}
                return Response(json_data)
            except Exception as e:
                json_data = {'code': 500, 'msg': '删除关联失败'+e }
                return Response(json_data)

