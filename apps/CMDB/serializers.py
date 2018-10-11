#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.models import Idc
from CMDB.model.oracle_modles import OracleUser,Oracle_Instance,Oracletablespace,OracleCluster

from serialize.oracle_serializers import *

from serialize.mysql_serializers import *

class IdcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idc
        fields="__all__"