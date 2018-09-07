# -*- coding: utf-8 -*-
from django.http import Http404,HttpResponse
from test.models import *
from test import serializers
from rest_framework import permissions
from roeops.permissions import AuthOrReadOnly
from rest_framework.views import APIView
from rest_framework import viewsets
from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from django.contrib.auth.decorators import login_required
from libs import api_response
# Create your views here.
@login_required()
def test_single(request):
    return render(request,'testpage/test_single.html')

@login_required()
def test_single_page(request):
    return render(request,'testpage/test_single_page.html')

@login_required()
def test_single_add(request):
    return render(request,'testpage/test_single_add.html')

from django.forms.models import model_to_dict
@login_required()
def test_single_edit(request,id):
    publisher=Publisher.objects.get(id=id)
    # 对于但个行的编辑要用 get 方法，相当于是字典， filter 方法返回的是结果集合方式，不能直接进行字典操作，还要作循环
    return render(request,'testpage/test_single_edit.html',locals())

class BookViewSet(viewsets.ModelViewSet):
    queryset = Book.objects.all()
    serializer_class = serializers.BookSerializer
    permission_classes = (permissions.IsAuthenticated, )


class PublisherViewSet(viewsets.ModelViewSet):
    queryset = Publisher.objects.all()
    serializer_class = serializers.PublisherSerializer
    # permission_classes = (permissions.IsAuthenticated, AuthOrReadOnly)
    permission_classes=()

    def perform_create(self, serializer):
        serializer.save(operator=self.request.user)






class PublisherList(APIView):
    """
   列出所有出版社或者创建一个 新的出版社
    """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()
    def get(self, request, format=None):
        queryset = Publisher.objects.all()

        s = serializers.PublisherSerializer(queryset, many=True)
        json_data={'code':0,'msg':'success'}
        json_data['data']=s.data
        return Response(json_data)

    def post(self, request, format=None):
        s = serializers.PublisherSerializer(data=request.data)
        if s.is_valid():  # 验证
            s.save()
            json_data = {'code':200, 'msg': 'success'}
            json_data['data'] = s.data
            return Response(json_data,content_type="application/json")
            # return api_response.JsonResponse(s.data,code=status.HTTP_200_OK,msg='success')
        return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)




class PublisherDetail(APIView):
    """
    细节操作
    """
    def get_object(self, id):
        try:
            return Publisher.objects.get(pk=id)
        except Publisher.DoesNotExist:
            raise Http404

    #
    def get(self, request, id, format=None):
        publisher = self.get_object(id)
        s = serializers.PublisherSerializer(publisher)
        return Response(s.data)

#更新条目
    def put(self, request, id, format=None):
        publisher = self.get_object(id)
        s = serializers.PublisherSerializer(publisher, data=request.data)
        if s.is_valid():
            s.save()
            return Response(s.data)
        return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)


import json




class Del_Publisher(APIView):
#删除功能
  permission_classes = ()
  def post(self, request,format=None):
        try:
            data_id = request.data['id']
        except KeyError as e:
            return HttpResponse(status=500)
        else:
            try:
                for i in data_id:
                    # if i['status'] == 1: 多级连删除
                    #     work_id = SqlOrder.objects.filter(id=i['id']).first()
                    #     SqlRecord.objects.filter(workid=work_id.work_id).delete()
                    #     SqlOrder.objects.filter(id=i['id']).delete()
                    # else:
                        Publisher.objects.filter(id=i).delete()
                json_data = {'code': 200, 'msg': '删除成功'}
                return Response(json_data)
            except Exception as e:
                return HttpResponse(status=500)


from rest_framework.pagination import PageNumberPagination

class MyPageNumberPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = "limit"
    page_query_param = 'page'
    max_page_size = 1000


#分页功能的
class PublisherListPage(APIView):
    """
     列出所有出版社或者创建一个 新的出版社
      """
    # permission_classes = (AuthOrReadOnly)
    permission_classes = ()

    def get(self, request, format=None):
        queryset = Publisher.objects.all()
        # count=Publisher.objects.count()
       ##########以下内容在数据展示列表中不需要修改
        pg=MyPageNumberPagination()   #实例化分页类
        page_data=pg.paginate_queryset(queryset=queryset,request=request,view=self) #根据请求的页码数，对数据进行分页
        s = serializers.PublisherSerializer(instance=page_data, many=True) #序列花这个分页数据
        next=pg.get_next_link() #获取下一页
        prev=pg.get_previous_link() #获取上页
        count=queryset.count() #获取数据总数
        json_data = {'code': 0, 'msg': 'success','count':count,'next':next,'prev':prev}
        json_data['data'] = s.data
        return Response(json_data)

#增加行条目
    def post(self, request, format=None):
        s = serializers.PublisherSerializer(data=request.data)
        if s.is_valid():  # 验证
            s.save()
            json_data = {'code': 200, 'msg': '数据添加成功'}
            json_data['data'] = s.data
            return Response(json_data, content_type="application/json")
            # return api_response.JsonResponse(s.data,code=status.HTTP_200_OK,msg='success')
        json_data = {'code': 500, 'msg': '数据添加失败，请检查数据格式'}
        json_data['data']=request.data
        return Response(json_data,content_type="application/json")