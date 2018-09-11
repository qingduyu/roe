#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.models import Idc,OracleCluster

class IdcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idc
        fields="__all__"



class OracleClusterSerializer(serializers.ModelSerializer):
    operator = serializers.ReadOnlyField(source="operator.username")
    #这样就不会显示为id号而是名字
    class Meta:
        model = OracleCluster
        fields="__all__"
