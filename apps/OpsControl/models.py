#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.db import models
import sys
from CMDB.model.server_models import Server_Assets

reload(sys)
sys.setdefaultencoding("utf-8")






class Log_Ansible_Model(models.Model):
    ans_user = models.CharField(max_length=50, verbose_name='使用用户', default=None)
    ans_model = models.CharField(max_length=100, verbose_name='模块名称', default=None)
    ans_args = models.CharField(max_length=500, blank=True, null=True, verbose_name='模块参数', default=None)
    ans_server = models.TextField(verbose_name='服务器', default=None)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'opsmanage_log_ansible_model'
        permissions = (
            ("can_read_log_ansible_model", "读取Ansible模块执行记录权限"),
            ("can_change_log_ansible_model", "更改Ansible模块执行记录权限"),
            ("can_add_log_ansible_model", "添加Ansible模块执行记录权限"),
            ("can_delete_log_ansible_model", "删除Ansible模块执行记录权限"),
        )
        verbose_name = 'Ansible模块执行记录表'
        verbose_name_plural = 'Ansible模块执行记录表'


class Ansible_Playbook(models.Model):
    type = (
        ('service', u'service'),
        ('group', u'group'),
        ('custom', u'custom'),
    )
    playbook_name = models.CharField(max_length=50, verbose_name='剧本名称', unique=True)
    playbook_desc = models.CharField(max_length=200, verbose_name='功能描述', blank=True, null=True)
    playbook_vars = models.TextField(verbose_name='模块参数', blank=True, null=True)
    playbook_uuid = models.CharField(max_length=50, verbose_name='唯一id')
    playbook_server_model = models.CharField(choices=type, verbose_name='服务器选择类型', max_length=10, blank=True, null=True)
    playbook_server_value = models.SmallIntegerField(verbose_name='服务器选择类型值', blank=True, null=True)
    playbook_file = models.FileField(upload_to='./playbook/', verbose_name='剧本路径')
    playbook_auth_group = models.SmallIntegerField(verbose_name='授权组', blank=True, null=True)
    playbook_auth_user = models.SmallIntegerField(verbose_name='授权用户', blank=True, null=True, )
    playbook_type = models.SmallIntegerField(verbose_name='剧本类型', blank=True, null=True, default=0)

    class Meta:
        db_table = 'opsmanage_ansible_playbook'
        permissions = (
            ("can_read_ansible_playbook", "读取Ansible剧本权限"),
            ("can_change_ansible_playbook", "更改Ansible剧本权限"),
            ("can_add_ansible_playbook", "添加Ansible剧本权限"),
            ("can_delete_ansible_playbook", "删除Ansible剧本权限"),
            ("can_exec_ansible_playbook", "执行Ansible剧本权限"),
        )
        verbose_name = 'Ansible剧本配置表'
        verbose_name_plural = 'Ansible剧本配置表'


class Ansible_Script(models.Model):
    script_name = models.CharField(max_length=50, verbose_name='脚本名称', unique=True)
    script_uuid = models.CharField(max_length=50, verbose_name='唯一id', blank=True, null=True)
    script_server = models.TextField(max_length=200, verbose_name='目标机器', blank=True, null=True)
    script_file = models.FileField(upload_to='./script/', verbose_name='脚本路径')
    script_args = models.TextField(blank=True, null=True, verbose_name='脚本参数')
    script_service = models.SmallIntegerField(verbose_name='授权业务', blank=True, null=True)
    script_group = models.SmallIntegerField(verbose_name='授权组', blank=True, null=True)
    script_type = models.CharField(max_length=50, verbose_name='脚本类型', blank=True, null=True)

    class Meta:
        db_table = 'opsmanage_ansible_script'
        permissions = (
            ("can_read_ansible_script", "读取Ansible脚本权限"),
            ("can_change_ansible_script", "更改Ansible脚本权限"),
            ("can_add_ansible_script", "添加Ansible脚本权限"),
            ("can_delete_ansible_script", "删除Ansible脚本权限"),
            ("can_exec_ansible_script", "执行Ansible脚本权限"),
            ("can_exec_ansible_model", "执行Ansible模块权限"),
            ("can_read_ansible_model", "读取Ansible模块权限"),
        )
        verbose_name = 'Ansible脚本配置表'
        verbose_name_plural = 'Ansible脚本配置表'


class Log_Ansible_Playbook(models.Model):
    ans_id = models.IntegerField(verbose_name='id', blank=True, null=True, default=None)
    ans_user = models.CharField(max_length=50, verbose_name='使用用户', default=None)
    ans_name = models.CharField(max_length=100, verbose_name='模块名称', default=None)
    ans_content = models.CharField(max_length=100, default=None)
    ans_server = models.TextField(verbose_name='服务器', default=None)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'log_ansible_playbook'
        permissions = (
            ("can_read_log_ansible_playbook", "读取Ansible剧本执行记录权限"),
            ("can_change_log_ansible_playbook", "更改Ansible剧本执行记录权限"),
            ("can_add_log_ansible_playbook", "添加Ansible剧本执行记录权限"),
            ("can_delete_log_ansible_playbook", "删除Ansible剧本执行记录权限"),
        )
        verbose_name = 'Ansible剧本操作记录表'
        verbose_name_plural = 'Ansible剧本操作记录表'


class Ansible_Playbook_Number(models.Model):
    playbook = models.ForeignKey('Ansible_Playbook', related_name='server_number', on_delete=models.CASCADE)
    playbook_server = models.CharField(max_length=100, verbose_name='目标服务器', blank=True, null=True)

    class Meta:
        db_table = 'opsmanage_ansible_playbook_number'
        permissions = (
            ("can_read_ansible_playbook_number", "读取Ansible剧本成员权限"),
            ("can_change_ansible_playbook_number", "更改Ansible剧本成员权限"),
            ("can_add_ansible_playbook_number", "添加Ansible剧本成员权限"),
            ("can_delete_ansible_playbook_number", "删除Ansible剧本成员权限"),
        )
        verbose_name = 'Ansible剧本成员表'
        verbose_name_plural = 'Ansible剧本成员表'

    def __unicode__(self):
        return '%s' % (self.playbook_server)


class Ansible_Inventory(models.Model):
    name = models.CharField(max_length=200, unique=True, verbose_name='资产名称')
    desc = models.CharField(max_length=200, verbose_name='功能描述')
    user = models.SmallIntegerField(verbose_name='创建人')
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='创建时间')

    class Meta:
        db_table = 'opsmanage_ansible_inventory'
        permissions = (
            ("can_read_ansible_inventory", "读取ansible资产权限"),
            ("can_change_ansible_inventory", "更改ansbile资产权限"),
            ("can_add_ansible_inventory", "添加ansible资产权限"),
            ("can_delete_ansible_inventory", "删除ansible资产权限"),
        )
        verbose_name = 'Ansible资产表'
        verbose_name_plural = 'Ansible资产表'




class Ansible_Inventory_Groups(models.Model):
    inventory = models.ForeignKey('Ansible_Inventory', related_name='inventory_group', on_delete=models.CASCADE)
    group_name = models.CharField(max_length=100, verbose_name='group name')
    ext_vars = models.TextField(verbose_name='组外部变量', blank=True, null=True)

    class Meta:
        db_table = 'opsmanage_ansible_inventory_groups'
        verbose_name = 'Ansible资产成员表'
        verbose_name_plural = 'Ansible资产成员表'
        unique_together = (("inventory", "group_name"))


class Ansible_Inventory_Groups_Server(models.Model):
    groups = models.ForeignKey('Ansible_Inventory_Groups', related_name='inventory_group_server',
                               on_delete=models.CASCADE)
    server = models.SmallIntegerField(verbose_name='服务器')

    class Meta:
        db_table = 'opsmanage_ansible_inventory_groups_servers'
        unique_together = (("groups", "server"))


class Ansible_CallBack_Model_Result(models.Model):
    logId = models.ForeignKey('Log_Ansible_Model')
    content = models.TextField(verbose_name='输出内容', blank=True, null=True)


class Ansible_CallBack_PlayBook_Result(models.Model):
    logId = models.ForeignKey('Log_Ansible_Playbook')
    content = models.TextField(verbose_name='输出内容', blank=True, null=True)

