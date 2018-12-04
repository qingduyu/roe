# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

class UserProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE,related_name='userprofile') #使用自带的用户管理模块进行管理
    real_name = models.CharField(max_length=32)
    phone=models.CharField(max_length=12,null=True)
    roles=models.ManyToManyField('Role',blank=True)

    def __str__(self):
        return self.real_name


class Role(models.Model):
    """角色表"""
    name=models.CharField(unique=True,max_length=32)
    desc=models.CharField(verbose_name=u'角色描述',max_length=50,blank=True,null=True)
    status=models.BooleanField(verbose_name=u'角色状态',blank=True,default=True)
    menus=models.ManyToManyField('LarryMenus')

    def __str__(self):
        return self.name





class LarryMenus(models.Model):
    pid=models.ForeignKey('self',verbose_name='父级菜单',null=True,blank=True,default=0,help_text=u'如果添加的是子菜单，请选择父菜单')
    title = models.CharField(max_length=32, verbose_name=u'菜单名')
    font=models.CharField(max_length=32, verbose_name=u'字体',default='larry-icon',null=True,blank=True)
    icon=models.CharField(max_length=32,verbose_name=u'图标',default='larry-widgets',null=True,blank=True)
    url=models.CharField(max_length=300,verbose_name=u'菜单地址',null=True,blank=True,default='javascript:void(0)',help_text=u'给菜单设置一个url地址')
    param=models.CharField(max_length=300,verbose_name=u'参数',null=True,blank=True,default='',help_text=u'给菜单设置参数')
    condition=models.CharField(max_length=300,verbose_name=u'状态',null=True,blank=True,default='',help_text=u'设定一个状态')
    spread = models.BooleanField(verbose_name=u'是否展开', default=False)
    priority = models.IntegerField(verbose_name=u'显示优先级', null=True, blank=True, help_text=u'菜单的显示顺序,优先级越大显示越靠前')
    show = models.NullBooleanField(verbose_name=u'是否显示', blank=True,null=True,default=False, help_text=u'菜单是否显示，默认不显示')

    def __str__(self):
        return '{parent}{name}'.format(name=self.title,parent="%s--->" % self.pid.title if self.pid else '')

    class Meta:
        verbose_name=u'larryMenus'
        verbose_name_plural=u'larryMenus'
        db_table ='larryMenus'






class Global_Config(models.Model):
    ansible_model = models.SmallIntegerField(verbose_name='是否开启ansible模块操作记录', blank=True, null=True)
    ansible_playbook = models.SmallIntegerField(verbose_name='是否开启ansible剧本操作记录', blank=True, null=True)
    cron = models.SmallIntegerField(verbose_name='是否开启计划任务操作记录', blank=True, null=True)
    project = models.SmallIntegerField(verbose_name='是否开启项目操作记录', blank=True, null=True)
    assets = models.SmallIntegerField(verbose_name='是否开启资产操作记录', blank=True, null=True)
    server = models.SmallIntegerField(verbose_name='是否开启服务器命令记录', blank=True, null=True)
    email = models.SmallIntegerField(verbose_name='是否开启邮件通知', blank=True, null=True)
    webssh = models.SmallIntegerField(verbose_name='是否开启WebSSH', blank=True, null=True)
    sql = models.SmallIntegerField(verbose_name='是否开启SQL更新通知', blank=True, null=True)

    class Meta:
        db_table = 'global_config'


class Email_Config(models.Model):
    site = models.CharField(max_length=100, verbose_name='部署站点')
    host = models.CharField(max_length=100, verbose_name='邮件发送服务器')
    port = models.SmallIntegerField(verbose_name='邮件发送服务器端口')
    user = models.CharField(max_length=100, verbose_name='发送用户账户')
    passwd = models.CharField(max_length=100, verbose_name='发送用户密码')
    subject = models.CharField(max_length=100, verbose_name='发送邮件主题标识', default=u'[OPS]')
    cc_user = models.TextField(verbose_name='抄送用户列表', blank=True, null=True)

    class Meta:
        db_table = 'email_config'


class Server_Command_Record(models.Model):
    user = models.CharField(max_length=50, verbose_name='远程用户')
    server = models.CharField(max_length=50, verbose_name='服务器IP')
    client = models.CharField(max_length=50, verbose_name='客户机IP', blank=True, null=True)
    command = models.TextField(verbose_name='历史命令', blank=True, null=True)
    etime = models.CharField(max_length=50, verbose_name='命令执行时间', unique=True)

    class Meta:
        db_table = 'server_command_record'
        permissions = (
            ("can_read_server_command_record", "读取服务器操作日志权限"),
            ("can_change_server_command_record", "更改服务器操作日志权限"),
            ("can_add_server_command_record", "添加服务器操作日志权限"),
            ("can_delete_server_command_record", "删除服务器操作日志权限"),
        )
        verbose_name = '服务器操作日志表'
        verbose_name_plural = '服务器操作日志表'




class User_Host(models.Model):
    host_id = models.SmallIntegerField(verbose_name='服务器资产id')
    user_id = models.SmallIntegerField(verbose_name='用户id')

    class Meta:
        db_table = 'user_host'
        permissions = (
            ("can_read_user_host", "读取用户服务器表权限"),
            ("can_change_user_host", "更改用户服务器表权限"),
            ("can_add_user_host", "添加用户服务器表权限"),
            ("can_delete_user_host", "删除用户服务器表权限"),
        )
        unique_together = (("host_id", "user_id"))
        verbose_name = '用户服务器表'
        verbose_name_plural = '用户服务器表'






from Orders.models import Order_System
# Create your models here.
import sys
reload(sys)
sys.setdefaultencoding("utf-8")


class FileUpload_Audit_Order(models.Model):
    order = models.OneToOneField(Order_System)
    dest_path = models.CharField(max_length=200,verbose_name='目标服务器文件路径')
    order_content =  models.TextField(verbose_name='工单申请内容')
    dest_server = models.TextField(verbose_name='目标服务器')
    chown_user = models.CharField(max_length=100,verbose_name='文件宿主')
    chown_rwx = models.CharField(max_length=100,verbose_name='文件权限')
    class Meta:
        db_table = 'fileupload_audit_order'
        permissions = (
            ("can_read_fileupload_audit_order", "读取文件上传审核工单权限"),
            ("can_change_fileupload_audit_order", "更改文件上传审核工单权限"),
            ("can_add_fileupload_audit_order", "添加文件上传审核工单权限"),
            ("can_delete_fileupload_audit_order", "删除文件上传审核工单权限"),
        )
        verbose_name = '文件上传审核工单表'
        verbose_name_plural = '文件上传审核工单表'

class UploadFiles(models.Model):
    file_order = models.ForeignKey('FileUpload_Audit_Order', related_name='files', on_delete=models.CASCADE)
    file_path = models.FileField(upload_to = './file/upload/%Y%m%d%H%M%S',verbose_name='文件上传路径',max_length=500)
    file_type = models.CharField(max_length=100,blank=True,null=True,verbose_name='文件类型')
    class Meta:
        db_table = 'uploadfiles'

class FileDownload_Audit_Order(models.Model):
    order = models.OneToOneField(Order_System)
    order_content =  models.TextField(verbose_name='工单申请内容')
    dest_server = models.TextField(verbose_name='目标服务器')
    dest_path = models.CharField(max_length=200,verbose_name='文件路径')
    class Meta:
        db_table = 'filedownload_audit_order'
        permissions = (
            ("can_read_filedownload_audit_order", "读取文件下载审核工单权限"),
            ("can_change_filedownload_audit_order", "更改文件下载审核工单权限"),
            ("can_add_filedownload_audit_order", "添加文件下载审核工单权限"),
            ("can_delete_filedownload_audit_order", "删除文件下载审核工单权限"),
        )
        verbose_name = '文件上传审核工单表'
        verbose_name_plural = '文件下载审核工单表'