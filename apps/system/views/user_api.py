#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.http import JsonResponse,HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User,Group,Permission
from django.contrib.auth.decorators import permission_required
from system.models import Role,UserProfile

from django.http import QueryDict
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from system.serialize import *

# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import viewsets, permissions
from rest_framework import status
from api import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required


@api_view(['GET', 'POST'])
@permission_required('add_user', raise_exception=True)
def user_list(request, format=None):
    """
    List all order, or create a server assets order.
    """
    if request.method == 'GET':
        snippets = User.objects.all()
        serializer = UserSerializer(snippets, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
@permission_required('change_user', raise_exception=True)
def user_detail(request, id, format=None):
    """
    Retrieve, update or delete a server assets instance.
    """
    try:
        snippet = User.objects.get(id=id)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = UserSerializer(snippet)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = UserSerializer(snippet, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        if not request.user.has_perm('delete_user'):
            return Response(status=status.HTTP_403_FORBIDDEN)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



@api_view(['GET', 'POST'])
@permission_required('roeops.add_group', raise_exception=True)
def group_list(request, format=None):
    """
    List all order, or create a server assets order.
    """
    if not request.user.has_perm('read_group'):
        return Response(status=status.HTTP_403_FORBIDDEN)
    if request.method == 'GET':
        snippets = Group.objects.all()
        serializer = GroupSerializer(snippets, many=True)
        return Response(serializer.data)
    elif request.method == 'POST':
        if not request.user.has_perm('Opsmanage.change_group'):
            return Response(status=status.HTTP_403_FORBIDDEN)
        serializer = GroupSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            # recordAssets.delay(user=str(request.user),
            #                    content="添加用户组：{group_name}".format(group_name=request.data.get("name")), type="group",
            #                    id=serializer.data.get('id'))
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'PUT', 'DELETE'])
@permission_required('roeops.change_group', raise_exception=True)
def group_detail(request, id, format=None):
    """
    Retrieve, update or delete a server assets instance.
    """
    try:
        snippet = Group.objects.get(id=id) #snnippet 1小片的意思
    except Group.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = GroupSerializer(snippet)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = GroupSerializer(snippet, data=request.data)
        old_name = snippet.name
        if serializer.is_valid():
            serializer.save()
            # recordAssets.delay(user=str(request.user),
            #                    content="修改用户组名称：{old_name} -> {group_name}".format(old_name=old_name,
            #                                                                        group_name=request.data.get("name")),
            #                    type="group", id=id)
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        if not request.user.has_perm('Opsmanage.delete_group'):
            return Response(status=status.HTTP_403_FORBIDDEN)
        snippet.delete()
        # recordAssets.delay(user=str(request.user), content="删除用户组：{group_name}".format(group_name=snippet.name),
        #                    type="group", id=id)
        return Response(status=status.HTTP_204_NO_CONTENT)
