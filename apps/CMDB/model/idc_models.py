#! /usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.db import models

IDCType = (
    ('DX', u'电信'),
    ('LT', u'联通'),
    ('YD', u'移动'),
    ('ZJ', u'自建'),
    ('BGP', u'BGP')
)

#IDC 机房信息
class Idc(models.Model):

    name = models.CharField(u"机房名称", max_length=30, null=True)
    type = models.CharField(choices=IDCType, max_length=20, verbose_name=u'机房类型', default='BGP')
    address = models.CharField(u"机房地址", max_length=100, null=True,blank=True)
    tel = models.CharField(u"机房电话", max_length=30, null=True,blank=True)
    contact = models.CharField(u"客户经理", max_length=30, null=True,blank=True)
    contact_phone = models.CharField(u"移动电话", max_length=30, null=True,blank=True)
    jigui = models.CharField(u"机柜信息", max_length=30, null=True,blank=True)
    ip_range = models.CharField(u"IP范围", max_length=30, null=True,blank=True)
    bandwidth = models.CharField(u"接入带宽", max_length=30, null=True,blank=True)
    start_date = models.DateField(null=True, blank=True, verbose_name=u'租赁日期')
    end_date = models.DateField(null=True, blank=True, verbose_name=u'到期日期')
    cost = models.CharField(blank=True, max_length=20, verbose_name=u'租赁费用')

    def __unicode__(self):
        return self.name

    class Meta:
        db_table=u'IDC'
        verbose_name = u'IDC'
        verbose_name_plural = verbose_name



class Zone_Assets(models.Model):
    zone_name = models.CharField(max_length=100, unique=True)
    zone_contact = models.CharField(max_length=100, blank=True, null=True, verbose_name='机房联系人')
    zone_number = models.CharField(max_length=100, blank=True, null=True, verbose_name='联系人号码')
    zone_network = models.CharField(max_length=100, blank=True, null=True, verbose_name='机房网段')
    '''自定义权限'''

    class Meta:
        db_table = 'opsmanage_zone_assets'
        permissions = (
            ("can_read_zone_assets", "读取机房资产权限"),
            ("can_change_zone_assets", "更改机房资产权限"),
            ("can_add_zone_assets", "添加机房资产权限"),
            ("can_delete_zone_assets", "删除机房资产权限"),
        )
        verbose_name = '机房资产表'
        verbose_name_plural = '机房资产表'


class Line_Assets(models.Model):
    line_name = models.CharField(max_length=100, unique=True)
    '''自定义权限'''

    class Meta:
        db_table = 'opsmanage_line_assets'
        permissions = (
            ("can_read_line_assets", "读取出口线路资产权限"),
            ("can_change_line_assetss", "更改出口线路资产权限"),
            ("can_add_line_assets", "添加出口线路资产权限"),
            ("can_delete_line_assets", "删除出口线路资产权限"),
        )
        verbose_name = '出口线路资产表'
        verbose_name_plural = '出口线路资产表'

