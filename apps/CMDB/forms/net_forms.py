#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django import forms
from django.forms.widgets import *

from CMDB.models import NetDevice, Idc, NetGroup

#继承modelform 就是 Model + Form  能够验证和数据库操作
class NetDeviceForm(forms.ModelForm):
    class Meta:
        model = NetDevice  #与model 中host 建立联系
        exclude = ("id",) #排除指定列
        #指定子段的显示方式，要放在meta类中，应该是一个字典影射，
        widgets = {
            'devicename': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;', 'placeholder': u'必填项'}),
            'in_band_ip': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;',}),
            'out_band_ip': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'in_net_ip': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'group': Select(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'asset_no': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'asset_type': Select(attrs={'class': 'form-control', 'style': 'width:530px;'}),

            'brand':Select(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'brand_model': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'status': Select(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'sn': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'idc': Select(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'cabinet': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'location': TextInput(attrs={'class':'form-control', 'style':'width:530px;'}),
            'useuser':TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'purpose':TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'soft_version': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'url': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'username': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'password': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
            'onlinedate': DateInput(attrs={type:'date','class': 'form-control','style': 'width:530px;' }),

            'memo': TextInput(attrs={'class': 'form-control', 'style': 'width:530px;'}),
        }



#Idc 机房的表单设计
class IdcForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super(IdcForm, self).clean()
        value = cleaned_data.get('name')
        try:
            Idc.objects.get(name=value)
            self._errors['name'] = self.error_class(["%s的信息已经存在" % value])
        except Idc.DoesNotExist:
            pass
        return cleaned_data

    class Meta:
        model = Idc
        exclude = ("id",)

        widgets = {
            "permission_name": TextInput(attrs={'class': 'form-control', 'style': 'width:450px;'}),
            'address': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
            'tel': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
            'contact': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
            'contact_phone': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
            'ip_range': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
            'jigui': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
            'bandwidth': TextInput(attrs={'class': 'form-control','style': 'width:450px;'}),
        }

#群组表单
class GroupForm(forms.ModelForm):

    def clean(self):
        cleaned_data = super(GroupForm, self).clean()
        value = cleaned_data.get('name')
        try:
            NetGroup.objects.get(name=value)
            self._errors['name'] = self.error_class(["%s的信息已经存在" % value])
        except NetGroup.DoesNotExist:
            pass
        return cleaned_data

    class Meta:
        model = NetGroup
        exclude = ("id", )