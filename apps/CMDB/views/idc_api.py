# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import  viewsets, permissions
from rest_framework import status
from rest_framework.views import APIView
from api import serializers
from rest_framework.response import Response


from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required
from CMDB.models import Idc
from CMDB.serializers import IdcSerializer
from django.core.serializers import serialize
from django.http.response import JsonResponse,Http404
from rest_framework.decorators import permission_classes
from rest_framework.decorators import authentication_classes
from rest_framework.authentication import SessionAuthentication, BasicAuthentication



from roeops.permissions import AuthOrReadOnly
from rest_framework.permissions import DjangoModelPermissions
from rest_framework.pagination import PageNumberPagination

class MyPageNumberPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = "limit"
    page_query_param = 'page'
    max_page_size = 1000


# 分页功能的
class IDCAPI(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get_object(self, id):
        try:
            return Idc.objects.get(id=id)
        except Idc.DoesNotExist:
            raise Http404

    def get(self, request, format=None):

            queryset = Idc.objects.all()

            ##########以下内容在数据展示列表中不需要修改
            pg = MyPageNumberPagination()  # 实例化分页类
            page_data = pg.paginate_queryset(queryset=queryset, request=request, view=self)  # 根据请求的页码数，对数据进行分页
            s = IdcSerializer(instance=page_data, many=True)  # 序列花这个分页数据
            next = pg.get_next_link()  # 获取下一页
            prev = pg.get_previous_link()  # 获取上页
            count = queryset.count()  # 获取数据总数
            json_data = {'code': 0, 'msg': 'success', 'count': count, 'next': next, 'prev': prev}
            json_data['data'] = s.data
            return Response(json_data)


    # 增加行条目
    def post(self, request, format=None):
        s = IdcSerializer(data=request.data)
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
            return Response(json_data)
        else:
            IDC = self.get_object(data_id)
            s = IdcSerializer(IDC, data=request.data)
            if s.is_valid():
                s.save()
                json_data = {'code': 200, 'msg': '更新成功'}
                return Response(json_data)
            json_data = {'code': 200, 'msg': '更新失败'}
            return Response(json_data, status=status.HTTP_200_OK)


    def delete(self, request, format=None):
        try:
            data_id = request.data['id']
        except KeyError as e:

            return Response(status=500)
        else:
            try:
                for i in data_id:
                    # if i['status'] == 1: 多级连删除
                    #     work_id = SqlOrder.objects.filter(id=i['id']).first()
                    #     SqlRecord.objects.filter(workid=work_id.work_id).delete()
                    #     SqlOrder.objects.filter(id=i['id']).delete()
                    # else:
                    Idc.objects.filter(id=i).delete()
                json_data = {'code': 200, 'msg': '删除成功'}
                return Response(json_data)
            except Exception as e:
                json_data = {'code': 500, 'msg': '删除失败'+e }
                return Response(json_data)
