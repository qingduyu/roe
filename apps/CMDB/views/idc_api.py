# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import  viewsets, permissions
from rest_framework import status
from rest_framework.views import APIView
from api import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view

from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required
from CMDB.models import Idc
from CMDB.serializers import IdcSerializer
from django.core.serializers import serialize
from django.http.response import JsonResponse
from rest_framework.decorators import permission_classes
from rest_framework.decorators import authentication_classes
from rest_framework.authentication import SessionAuthentication, BasicAuthentication

from roeops.baseview import MyBaseModelView

from roeops.permissions import AuthOrReadOnly
from rest_framework.permissions import DjangoModelPermissions



#
# class IdcViewset(MyBaseModelView):
#     queryset=Idc.objects.all()
#     serializer_class=IdcSerializer
#     permission_classes = [AuthOrReadOnly,DjangoModelPermissions]


@api_view(['GET','POST'])
@permission_classes((AuthOrReadOnly,DjangoModelPermissions ))
def idc_list(request,format=None):
    if request.method == 'GET':
        snippets = Idc.objects.all()
        data = serialize(snippets)
        return JsonResponse(data)
    elif request.method == 'POST':
        serializer = IdcSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)