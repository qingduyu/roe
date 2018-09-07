# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import viewsets, permissions
from rest_framework import status
from api import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from django.contrib.auth.decorators import permission_required
from CMDB.models import OracleCluster
from CMDB.serializers import OracleClusterSerializer





class OracleClusterViewset(viewsets.ModelViewSet):
    queryset=OracleCluster.objects.all()
    serializer_class=OracleClusterSerializer



