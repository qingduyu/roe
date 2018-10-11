#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers

# from CMDB.model.mongo_models import MongoCluster,Mongo_Instance,MongoDBName,MongoDBUser
#
# ###################################################################
# class MongoClusterSerializer(serializers.ModelSerializer):
#     operator = serializers.ReadOnlyField(source="operator.username")
#     class Meta:
#         model = MongoCluster
#         fields='__all__'
#
#
# class MongoUserSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#     #这样就不会显示为id号而是名字
#     class Meta:
#         model = MongoDBUser
#         fields="__all__"
#
#
# class MongoDBSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#
#     # 这样就不会显示为id号而是名字
#     class Meta:
#         model = MongoDBName
#         fields = "__all__"
#
# class MongoInstanceSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#
#     # 这样就不会显示为id号而是名字
#     class Meta:
#         model = Mongo_Instance
#         fields = "__all__"
#
#
#