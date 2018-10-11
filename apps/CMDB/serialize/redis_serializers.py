#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers

# from CMDB.model.redis_modles import Redis_Instance,RedistCluster,Redisdb

# ########################################################################
#
# class RedisClusterSerializer(serializers.ModelSerializer):
#     operator = serializers.ReadOnlyField(source="operator.username")
#     class Meta:
#         model = RedistCluster
#         fields='__all__'
#
#
#
#
# class RedisDBSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#
#     # 这样就不会显示为id号而是名字
#     class Meta:
#         model = Redisdb
#         fields = "__all__"
#
# class RedisInstanceSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#
#     # 这样就不会显示为id号而是名字
#     class Meta:
#         model = Redis_Instance
#         fields = "__all__"
#
