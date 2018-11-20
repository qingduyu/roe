# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from mptt.models import MPTTModel,TreeForeignKey
from django.db import models


# class YewuTree(models.Model):
#     name=models.CharField(max_length=32)
#     href=models.CharField(max_length=200,blank=True,null=True,help_text='moxingbiao')
#     parent = models.ForeignKey('self', on_delete=models.CASCADE,null=True, blank=True, related_name='children',db_index=True)
#     root=models.ForeignKey('self',on_delete=models.CASCADE,null=True,blank=True,related_name='sunzi',help_text='指定根结点为产品线节点，为了展示根结点的名字，防止树的高度过高')
#
#     def __str__(self):
# #         return self.name
# class Meta:
#     db_table = 'yewuTree'
#     verbose_name = '业务树'
#     verbose_name_plural = verbose_name
#

class YewuTreeMptt(MPTTModel):
    name=models.CharField(max_length=32,null=True,blank=True)
    href=models.CharField(max_length=200,blank=True,null=True,help_text='moxingbiao')
    position = models.SmallIntegerField( blank=True, null=True, help_text='展示位置，并列时为了次序好看') #功能还没加
    parent = TreeForeignKey('self', on_delete=models.CASCADE,null=True, blank=True, related_name='children',db_index=True,verbose_name='父节点')
    isLast=models.BooleanField(verbose_name='是否最后节点',default=False,blank=True)
    yewuxian=models.ForeignKey('self',on_delete=models.SET_NULL,null=True,blank=True,related_name='chanpinxian',help_text='指定根结点为产品线节点，为了展示业务线节点的名字，防止树的高度过高')

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'yewuTreeMptt'
        verbose_name='业务树'
        verbose_name_plural=verbose_name
    class MPTTMeta:
        level_attr = 'mptt_level'
        order_insertion_by = ['name']



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


