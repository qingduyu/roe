#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.model.server_models import scan_host_conf

class ScanHostConf_Serializer(serializers.ModelSerializer):
    class Meta:
        model = scan_host_conf
        fields='__all__'



