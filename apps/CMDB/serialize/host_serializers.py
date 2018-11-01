#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.model.server_models import Host,Host_fail

class Host_Serializer(serializers.ModelSerializer):
    class Meta:
        model = Host
        fields='__all__'



class Host_read_Serializer(serializers.ModelSerializer):
    class Meta:
        model = Host
        fields='__all__'


class HostFail_Serializer(serializers.ModelSerializer):
    class Meta:
        model = Host_fail
        fields='__all__'