#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers

from MysqlOps.models import BinlogParseRedo,BinlogParseUndo,MysqlFastSQL,mysql_sql_log



class BinlogParseRedoSerializer(serializers.ModelSerializer):
    class Meta:
        model = BinlogParseRedo
        fields='__all__'


class BinlogParseUndoSerializer(serializers.ModelSerializer):
    class Meta:
        model = BinlogParseUndo
        fields='__all__'


class MysqlfastSQLSerializer(serializers.ModelSerializer):
    class Meta:
        model = MysqlFastSQL
        fields='__all__'


class MysqlSQLLOGSerializer(serializers.ModelSerializer):
    class Meta:
        model= mysql_sql_log
        fields='__all__'