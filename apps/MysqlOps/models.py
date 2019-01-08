#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.db import models
import sys

reload(sys)
sys.setdefaultencoding("utf-8")


class BinlogParseRedo(models.Model):
    sql = models.CharField(max_length=4000,blank=True, null=True, verbose_name='解析后的sql')
    start_pos = models.IntegerField(blank=True, null=True, verbose_name='起始位置')
    end_pos = models.IntegerField(blank=True, null=True, verbose_name='结束位置')
    date = models.CharField(max_length=50,blank=True, null=True, verbose_name='执行日期')
    time = models.CharField(max_length=50, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'binlogParseRedo'
        verbose_name = 'bin日志解析'
        verbose_name_plural = 'bin日志解析'

class BinlogParseUndo(models.Model):
    sql = models.CharField(max_length=4000,blank=True, null=True, verbose_name='逆向解析后的sql')
    start_pos = models.IntegerField(blank=True, null=True, verbose_name='起始位置')
    end_pos = models.IntegerField(blank=True, null=True, verbose_name='结束位置')
    date = models.CharField(max_length=50,blank=True, null=True, verbose_name='执行日期')
    time = models.CharField(max_length=50, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'binlogParseUndo'
        verbose_name = 'bin日志逆向解析'
        verbose_name_plural = 'bin日志逆向解析'


SQL_EXEC = (
    (u"主库", u"主库"),
    (u"从库", u"从库"),
    (u"集群", u"集群"),
    (u"其他",u'其他')
)

class MysqlFastSQL(models.Model):
    name= models.CharField(max_length=30,verbose_name='sql名字')
    desc=models.CharField(max_length=200,blank=True,null=True,verbose_name='说明文字')
    sql = models.CharField(max_length=1000,verbose_name='sql 语句请自己验证正确')
    exec_posi = models.CharField(verbose_name=u"执行位置", choices=SQL_EXEC, max_length=30, null=True, blank=True)



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

