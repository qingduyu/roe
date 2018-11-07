#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers

from MysqlOps.models import BinlogParseRedo,BinlogParseUndo



class BinlogParseRedoSerializer(serializers.ModelSerializer):
    class Meta:
        model = BinlogParseRedo
        fields='__all__'


class BinlogParseUndoSerializer(serializers.ModelSerializer):
    class Meta:
        model = BinlogParseUndo
        fields='__all__'
