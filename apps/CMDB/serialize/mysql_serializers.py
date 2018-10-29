#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers


from CMDB.model.mysql_modles import MySQLCluster,Mysql_User,MySQL_Instance,Mysql_db


class MysqlClusterSerializer(serializers.ModelSerializer):
    operator = serializers.ReadOnlyField(source="operator.username")
    class Meta:
        model = MySQLCluster
        fields='__all__'


class MysqlCluster_read_Serializer(serializers.ModelSerializer):
    operator = serializers.ReadOnlyField(source="operator.username")
    class Meta:
        model = MySQLCluster
        fields=('name','arch','db_version','foreign_ip','foreign_port','tree_id'
                ,'desc','operator','status','up_date','down_date')

class MysqlCluster_write_Serializer(serializers.ModelSerializer):
    class Meta:
        model = MySQLCluster
        fields='__all__'

class MysqlUser_read_Serializer(serializers.ModelSerializer):
    dbcluster = serializers.ReadOnlyField(source="dbcluster.name")
    #这样就不会显示为id号而是名字
    class Meta:
        model = Mysql_User
        fields=('id',"db_user",'db_host','dbcluster','db_password','privlige','memo')


class MysqlUser_write_Serializer(serializers.ModelSerializer):
    class Meta:
        model = Mysql_User
        fields="__all__"




class MysqlDB_read_Serializer(serializers.ModelSerializer):
    dbcluster = serializers.ReadOnlyField(source="dbcluster.name")

    # 这样就不会显示为id号而是名字
    class Meta:
        model = Mysql_db
        fields = ('id',"dbname",'dbcluster','db_size','db_rows','index_size','memo')

class MysqlDB_write_Serializer(serializers.ModelSerializer):
    # 这样就不会显示为id号而是名字
    class Meta:
        model = Mysql_db
        fields = "__all__"

#mysql 实例读取，
class MysqlInstance_read_Serializer(serializers.ModelSerializer):
    dbcluster=serializers.ReadOnlyField(source='dbcluster.name')
    # role=serializers.CharField(source=MyDB_ROLE.index(1))

    class Meta:
        model = MySQL_Instance
        fields = ("id",'dbtag','vist_ip','m_ip','port','master_ip',
                  'master_port','idc','dbcluster','role','db_status',
                  'memo',)
        # fields="这里和model中的子段不一致，导致序列化为空，气死我了"

class MysqlInstance_write_Serializer(serializers.ModelSerializer):

    # 这样就不会显示为id号而是名字
    class Meta:
        model = MySQL_Instance
        fields = "__all__"
    #
    # def create(self, validated_data):
    #     return MySQL_Instance.objects.create(**validated_data)