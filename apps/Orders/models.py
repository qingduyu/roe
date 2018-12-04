# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from CodeOps.models import Project_Config

class Order_System(models.Model):
    STATUS = (
        #               (0,'已通过'),
        (1, '已拒绝'),
        (2, '审核中'),
        (3, '已部署'),
        (4, '待授权'),
        (5, '已执行'),
        (6, '已回滚'),
        (7, '已撤回'),
        (8, '已授权'),
        (9, '已失败'),
    )
    LEVEL = (
        (0, '非紧急'),
        (1, '紧急'),
    )
    TYPE = (
        (0, 'SQL审核'),
        (1, '代码部署'),
        (2, '文件上传'),
        (3, '文件下载'),
    )
    order_user = models.SmallIntegerField(verbose_name='工单申请人id')
    order_subject = models.CharField(max_length=200, blank=True, null=True, verbose_name='工单申请主题')
    order_executor = models.SmallIntegerField(verbose_name='工单处理人id')
    order_status = models.IntegerField(choices=STATUS, default='审核中', verbose_name='工单状态')
    order_level = models.IntegerField(choices=LEVEL, blank=True, null=True, verbose_name='工单紧急程度')
    order_type = models.IntegerField(choices=TYPE, verbose_name='工单类型')
    order_cancel = models.TextField(blank=True, null=True, verbose_name='取消原因')
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='工单发布时间')
    modify_time = models.DateTimeField(auto_now=True, blank=True, verbose_name='工单最后修改时间')
    '''自定义权限'''

    class Meta:
        db_table = 'order_system'
        permissions = (
            ("can_read_order_system", "读取工单系统权限"),
            ("can_change_order_systemr", "更改工单系统权限"),
            ("can_add_order_system", "添加工单系统权限"),
            ("can_delete_order_system", "删除工单系统权限"),
        )
        unique_together = (("order_subject", "order_user", "order_type"))
        verbose_name = '工单系统表'
        verbose_name_plural = '工单系统表'


class Project_Order(models.Model):
    order = models.OneToOneField('Order_System')
    order_project = models.ForeignKey('CodeOps.Project_Config', related_name='order_project', verbose_name='项目id')
    order_content = models.TextField(verbose_name='工单申请内容')
    order_branch = models.CharField(max_length=50, blank=True, null=True, verbose_name='分支版本')
    order_comid = models.CharField(max_length=100, blank=True, null=True, verbose_name='版本id')
    order_tag = models.CharField(max_length=50, blank=True, null=True, verbose_name='标签')
    '''自定义权限'''

    class Meta:
        db_table = 'project_order'
        permissions = (
            ("can_read_project_order", "读取代码部署工单权限"),
            ("can_change_project_order", "更改代码部署工单权限"),
            ("can_add_project_order", "添加代码部署工单限"),
            ("can_delete_project_order", "删除代码部署工单权限"),
        )
        verbose_name = '代码部署工单表'
        verbose_name_plural = '代码部署工单表'


