#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.models import Idc
from CMDB.model.oracle_modles import OracleUser,Oracle_Instance,Oracletablespace,OracleCluster


#############################################################

class OracleClusterSerializer(serializers.ModelSerializer):
    operator = serializers.ReadOnlyField(source="operator.username")
    #这样就不会显示为id号而是名字
    class Meta:
        model = OracleCluster
        fields="__all__"



class OracleUserSerializer(serializers.ModelSerializer):
    dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
    #这样就不会显示为id号而是名字
    class Meta:
        model = OracleUser
        fields="__all__"


class OracleTablespaceSerializer(serializers.ModelSerializer):
    dbcluster = serializers.ReadOnlyField(source="dbcluster.name")

    # 这样就不会显示为id号而是名字
    class Meta:
        model = Oracletablespace
        fields = "__all__"

class OracleInstanceSerializer(serializers.ModelSerializer):
    dbcluster = serializers.ReadOnlyField(source="dbcluster.name")

    # 这样就不会显示为id号而是名字
    class Meta:
        model = Oracle_Instance
        fields = "__all__"

