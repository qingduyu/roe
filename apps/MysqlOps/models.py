#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.db import models
import sys

reload(sys)
sys.setdefaultencoding("utf-8")


class BinlogParseRedo(models.Model):
    sql = models.CharField(max_length=1900,blank=True, null=True, verbose_name='解析后的sql')
    start_pos = models.IntegerField(blank=True, null=True, verbose_name='起始位置')
    end_pos = models.IntegerField(blank=True, null=True, verbose_name='结束位置')
    date = models.CharField(max_length=50,blank=True, null=True, verbose_name='执行日期')
    time = models.CharField(max_length=50, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'binlogParseRedo'
        verbose_name = 'bin日志解析'
        verbose_name_plural = 'bin日志解析'

class BinlogParseUndo(models.Model):
    sql = models.CharField(max_length=1900,blank=True, null=True, verbose_name='逆向解析后的sql')
    start_pos = models.IntegerField(blank=True, null=True, verbose_name='起始位置')
    end_pos = models.IntegerField(blank=True, null=True, verbose_name='结束位置')
    date = models.CharField(max_length=50,blank=True, null=True, verbose_name='执行日期')
    time = models.CharField(max_length=50, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'binlogParseUndo'
        verbose_name = 'bin日志逆向解析'
        verbose_name_plural = 'bin日志逆向解析'






class Custom_High_Risk_SQL(models.Model):
    sql = models.CharField(max_length=200, unique=True, verbose_name='SQL内容')

    class Meta:
        db_table = 'custom_high_risk_sql'
        permissions = (
            ("can_read_custom_high_risk_sql", "读取高危SQL表权限"),
            ("can_change_custom_high_risk_sql", "更改高危SQL表权限"),
            ("can_add_custom_high_risk_sql", "添加高危SQL表权限"),
            ("can_delete_custom_high_risk_sql", "删除高危SQL表权限"),
        )
        verbose_name = '自定义高危SQL表'
        verbose_name_plural = '自定义高危SQL表'

