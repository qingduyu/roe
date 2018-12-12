#! /usr/bin/env python
# -*- coding: utf-8 -*-
from rest_framework import serializers
from CMDB.model.server_models import Host,Host_fail

class Host_Serializer(serializers.ModelSerializer):
    class Meta:
        model = Host
        fields='__all__'



class Host_read_Serializer(serializers.ModelSerializer):
    # tree_id=serializers.ReadOnlyField(source='yewu_host.chanpinxian.name')  #这mptt 类型的数据无法获取外健的信息
    idc=serializers.ReadOnlyField(source='idc.name')
    class Meta:
        model = Host
        fields=('id','hostname','ip','ip_control','ip_other','asset_no','asset_type','hostserver','status',
                'vendor','cpu_model','cpu_num','memory','disk','sn','idc','cabinet','location','uplink_port','useuser',
                'purpose','system_type','port','ssh_status','onlinedate','ctime','is_pooled','memo')


class HostFail_Serializer(serializers.ModelSerializer):
    class Meta:
        model = Host_fail
        fields='__all__'