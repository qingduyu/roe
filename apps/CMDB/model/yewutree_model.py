# -*- coding: utf-8 -*-
from __future__ import unicode_literals
# from mptt.models import MPTTModel,TreeForeignKey
from django.db import models


class YewuTree(models.Model):
    name=models.CharField(max_length=32)
    href=models.CharField(max_length=200,blank=True,null=True,help_text='moxingbiao')
    parent = models.ForeignKey('self', on_delete=models.CASCADE,null=True, blank=True, related_name='children',db_index=True)
    root=models.ForeignKey('self',on_delete=models.CASCADE,null=True,blank=True,related_name='sunzi',help_text='指定根结点为产品线节点，为了展示根结点的名字，防止树的高度过高')

    def __str__(self):
        return self.name





#产品线表 产品线是头，
class Productline(models.Model):
    name = models.CharField(u"产品线名称", max_length=50, unique=True, null=False, blank=False)
    description = models.CharField(u"产品线描述", max_length=255, null=True, blank=True)
    incharger = models.CharField(u"负责人姓名", max_length=50, unique=True, null=False, blank=False)
    phone = models.CharField(u"负责人手机", max_length=50, null=False, blank=False)
    qq = models.CharField(u"负责人QQ", max_length=100, null=True, blank=True)
    weChat = models.CharField(u"负责人微信", max_length=100, null=True, blank=True)
    email = models.CharField(u"负责人邮箱", max_length=150, null=True, blank=True)

    def __unicode__(self):
        return self.name


