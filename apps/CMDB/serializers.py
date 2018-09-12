#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.models import Idc
from CMDB.model.oracle_modles import OracleUser,Oracle_Instance,Oracletablespace,OracleCluster

# from CMDB.model.mysql_modles import MySQLCluster,Mysql_User,MySQL_Instance,Mysql_db
#
# from CMDB.model.mongo_models import MongoCluster,Mongo_Instance,MongoDBName,MongoDBUser
#
# from CMDB.model.redis_modles import Redis_Instance,RedistCluster,Redisdb

class IdcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idc
        fields="__all__"

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

# ####################################################################
#
# class MysqlClusterSerializer(serializers.ModelSerializer):
#     operator = serializers.ReadOnlyField(source="operator.username")
#     class Meta:
#         model = MySQLCluster
#         fields='__all__'
#
#
# class MysqlUserSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#     #这样就不会显示为id号而是名字
#     class Meta:
#         model = Mysql_User
#         fields="__all__"
#
#
# class MysqlDBSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#
#     # 这样就不会显示为id号而是名字
#     class Meta:
#         model = Mysql_db
#         fields = "__all__"
#
# class MysqlInstanceSerializer(serializers.ModelSerializer):
#     dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
#
#     # 这样就不会显示为id号而是名字
#     class Meta:
#         model = MySQL_Instance
#         fields = "__all__"
#
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
#
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
