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






