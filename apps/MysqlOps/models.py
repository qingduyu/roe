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

class Inception_Server_Config(models.Model):
    db_name = models.CharField(max_length=100, verbose_name='数据库名', blank=True, null=True)
    db_host = models.CharField(max_length=100, verbose_name='数据库地址')
    db_user = models.CharField(max_length=100, verbose_name='用户', blank=True, null=True)
    db_passwd = models.CharField(max_length=100, verbose_name='密码', blank=True, null=True)
    db_backup_host = models.CharField(max_length=100, verbose_name='备份数据库地址')
    db_backup_user = models.CharField(max_length=100, verbose_name='备份数据库账户')
    db_backup_passwd = models.CharField(max_length=100, verbose_name='备份数据库密码')
    db_backup_port = models.SmallIntegerField(verbose_name='备份数据库端口')
    db_port = models.SmallIntegerField(verbose_name='端口')

    class Meta:
        db_table = 'opsmanage_inception_server_config'
        permissions = (
            ("can_read_inception_server_config", "读取inception信息表权限"),
            ("can_change_inception_server_config", "更改inception信息表权限"),
            ("can_add_inception_server_config", "添加inception信息表权限"),
            ("can_delete_inception_server_config", "删除inception信息表权限"),
        )
        verbose_name = 'inception信息表'
        verbose_name_plural = 'inception信息表'


class DataBase_Server_Config(models.Model):
    env_type = (
        ('test', u'测试环境'),
        ('prod', u'生产环境'),
    )
    mode = (
        ('1', u'单例'),
        ('2', u'主从'),
        ('3', u'pxc'),
    )
    db_env = models.CharField(choices=env_type, max_length=10, verbose_name='环境类型', default=None)
    db_type = models.CharField(max_length=10, verbose_name='数据库类型', default=None)
    db_name = models.CharField(max_length=100, verbose_name='数据库名', blank=True, null=True)
    db_host = models.CharField(max_length=100, verbose_name='数据库地址')
    db_mode = models.SmallIntegerField(choices=mode, verbose_name='架构类型', default=1)
    db_user = models.CharField(max_length=100, verbose_name='用户')
    db_passwd = models.CharField(max_length=100, verbose_name='密码')
    db_port = models.IntegerField(verbose_name='端口')
    db_group = models.SmallIntegerField(verbose_name='使用组')
    db_service = models.SmallIntegerField(verbose_name='业务类型')
    db_project = models.SmallIntegerField(verbose_name='所属项目')
    db_mark = models.CharField(max_length=100, verbose_name='标识', blank=True, null=True)

    class Meta:
        db_table = 'opsmanage_database_server_config'
        permissions = (
            ("can_read_database_server_config", "读取数据库信息表权限"),
            ("can_change_database_server_config", "更改数据库信息表权限"),
            ("can_add_database_server_config", "添加数据库信息表权限"),
            ("can_delete_database_server_config", "删除数据库信息表权限"),
        )
        unique_together = (("db_port", "db_host", "db_env", "db_name"))
        verbose_name = '数据库信息表'
        verbose_name_plural = '数据库信息表'


class SQL_Execute_Histroy(models.Model):
    exe_user = models.CharField(max_length=100, verbose_name='执行人')
    exe_db = models.ForeignKey('DataBase_Server_Config', verbose_name='数据库id')
    exe_sql = models.TextField(verbose_name='执行的SQL内容')
    exec_status = models.SmallIntegerField(blank=True, null=True, verbose_name='执行状态')
    exe_result = models.TextField(blank=True, null=True, verbose_name='执行结果')
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'opsmanage_sql_execute_histroy'
        permissions = (
            ("can_read_sql_execute_histroy", "读取SQL执行历史表权限"),
            ("can_change_sql_execute_histroy", "更改SQL执行历史表权限"),
            ("can_add_sql_execute_histroy", "添加SQL执行历史表权限"),
            ("can_delete_sql_execute_histroy", "删除SQL执行历史表权限"),
        )
        verbose_name = 'SQL执行历史记录表'
        verbose_name_plural = 'SQL执行历史记录表'


class Custom_High_Risk_SQL(models.Model):
    sql = models.CharField(max_length=200, unique=True, verbose_name='SQL内容')

    class Meta:
        db_table = 'opsmanage_custom_high_risk_sql'
        permissions = (
            ("can_read_custom_high_risk_sql", "读取高危SQL表权限"),
            ("can_change_custom_high_risk_sql", "更改高危SQL表权限"),
            ("can_add_custom_high_risk_sql", "添加高危SQL表权限"),
            ("can_delete_custom_high_risk_sql", "删除高危SQL表权限"),
        )
        verbose_name = '自定义高危SQL表'
        verbose_name_plural = '自定义高危SQL表'


class SQL_Audit_Control(models.Model):
    t_auto_audit = models.SmallIntegerField(blank=True, null=True, verbose_name='测试环境自动授权')
    t_backup_sql = models.SmallIntegerField(blank=True, null=True, verbose_name='测试环境自动备份SQL')
    t_email = models.SmallIntegerField(blank=True, null=True, verbose_name='测试环境开启邮件通知')
    p_auto_audit = models.SmallIntegerField(blank=True, null=True, verbose_name='正式环境自动授权')
    p_backup_sql = models.SmallIntegerField(blank=True, null=True, verbose_name='正式环境自动备份SQL')
    p_email = models.SmallIntegerField(blank=True, null=True, verbose_name='正式环境开启邮件通知')
    audit_group = models.CharField(max_length=100, blank=True, null=True, verbose_name='审核组')

    class Meta:
        db_table = 'opsmanage_sql_audit_control'
        permissions = (
            ("can_read_sql_audit_control", "读取SQL审核配置表权限"),
            ("can_change_sql_audit_control", "更改SQL审核配置表权限"),
            ("can_add_sql_audit_control", "添加SQL审核配置权限"),
            ("can_delete_sql_audit_control", "删除SQL审核配置权限"),
        )
        verbose_name = 'SQL审核配置'
        verbose_name_plural = 'SQL审核配置'