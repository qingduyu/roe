#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.models import Idc

class IdcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Idc
        fields="__all__"


