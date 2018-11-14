#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.http import JsonResponse,HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User,Group,Permission
from django.contrib.auth.decorators import permission_required
from system.models import Role,UserProfile
from django.db.models import Q

from django.http import QueryDict
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from system.serializers import *

from django.shortcuts import render
from CMDB.model.server_models import  Host
from django.contrib.auth.decorators import permission_required
from django.contrib.auth.decorators import login_required




def webssh_list(request):
    try:
        serverList=Host.objects.all().order_by('id')

    except Exception as e:
        print  e
    return render(request,'system/webssh/webssh_list.html',locals())

@login_required(login_url='/login')
def webssh(request, sid):
    try:
        server = Host.objects.get(id=sid)
        # serverList=Host.objects.all()

        return render(request,'system/webssh/webssh.html',{"user": request.user, "server": server})

        # if request.user.is_superuser:
        #     serverList = Host.objects.all()
        #     return render(request, 'webssh/webssh.html', {"user": request.user, "server": server,
        #                                                   "serverList": serverList})
        # else:
        #     user_server = User_Server.objects.get(user_id=request.user.id, server_id=sid)
        #     userServer = User_Server.objects.filter(user_id=request.user.id)
        #     serverList = []
        #     for s in userServer:
        #         ser = Server_Assets.objects.get(id=s.server_id)
        #         serverList.append(ser)
        #     if user_server:
        #         return render(request, 'webssh/webssh.html', {"user": request.user, "server": server,
        #                                                       "serverList": serverList})
    except Exception, ex:
        return render(request, 'system/webssh/webssh.html', {"user": request.user, "errorInfo": "无法获取任何主机信息"})
