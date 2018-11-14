# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import viewsets, permissions
from rest_framework import status
from api import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required
from MysqlOps.models import BinlogParseRedo,BinlogParseUndo
from serializers import BinlogParseUndoSerializer,BinlogParseRedoSerializer
from rest_framework.views import APIView
from django.http.response import JsonResponse,Http404
from rest_framework.parsers import JSONParser


from rest_framework.pagination import PageNumberPagination

class MyPageNumberPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = "limit"
    page_query_param = 'page'
    max_page_size = 1000


# 分页功能的
class BinlogRedoAPI(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get_object(self, id):
        try:
            return BinlogParseRedo.objects.get(id=id)
        except BinlogParseRedo.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

            queryset = BinlogParseRedo.objects.all().order_by('id')

            ##########以下内容在数据展示列表中不需要修改
            pg = MyPageNumberPagination()  # 实例化分页类
            page_data = pg.paginate_queryset(queryset=queryset, request=request, view=self)  # 根据请求的页码数，对数据进行分页
            s = BinlogParseRedoSerializer(instance=page_data, many=True)  # 序列花这个分页数据
            next = pg.get_next_link()  # 获取下一页
            prev = pg.get_previous_link()  # 获取上页
            count = queryset.count()  # 获取数据总数
            json_data = {'code': 0, 'msg': 'success', 'count': count, 'next': next, 'prev': prev}
            json_data['data'] = s.data
            return Response(json_data)




# 分页功能的
class BinlogUndoAPI(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get_object(self, id):
        try:
            return BinlogParseUndo.objects.get(id=id)
        except BinlogParseUndo.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

            queryset = BinlogParseUndo.objects.all().order_by('id')

            ##########以下内容在数据展示列表中不需要修改
            pg = MyPageNumberPagination()  # 实例化分页类
            page_data = pg.paginate_queryset(queryset=queryset, request=request, view=self)  # 根据请求的页码数，对数据进行分页
            s = BinlogParseUndoSerializer(instance=page_data, many=True)  # 序列花这个分页数据
            next = pg.get_next_link()  # 获取下一页
            prev = pg.get_previous_link()  # 获取上页
            count = queryset.count()  # 获取数据总数
            json_data = {'code': 0, 'msg': 'success', 'count': count, 'next': next, 'prev': prev}
            json_data['data'] = s.data
            return Response(json_data)
