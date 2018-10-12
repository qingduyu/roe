#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.model.server_models import IpSource

class IP_Serializer(serializers.ModelSerializer):
    class Meta:
        model = IpSource
        fields='__all__'