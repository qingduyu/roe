#! /usr/bin/env python
#-*- coding: utf-8 -*-

from __future__ import unicode_literals
from CMDB.model.yewutree_model import YewuTreeMptt
from django.contrib.auth.models import User
from CMDB.model.idc_models import Idc

from django.db import models

class Assets(models.Model):
    assets_type_choices = (
        ('server', u'物理机'),
        ('vmser', u'虚拟机')
    )
    assets_type = models.CharField(choices=assets_type_choices, max_length=100, default='server', verbose_name='资产类型')
    name = models.CharField(max_length=100, verbose_name='资产编号', blank=True, null=True)
    sn = models.CharField(max_length=100, verbose_name='设备序列号', blank=True, null=True)
    buy_time = models.DateField(blank=True, null=True, verbose_name='购买时间')
    expire_date = models.DateField(u'过保修期', null=True, blank=True)
    buy_user = models.SmallIntegerField(blank=True, null=True, verbose_name='购买人')
    management_ip = models.GenericIPAddressField(u'管理IP', blank=True, null=True)
    manufacturer = models.CharField(max_length=100, blank=True, null=True, verbose_name='制造商')
    provider = models.CharField(max_length=100, blank=True, null=True, verbose_name='供货商')
    model = models.CharField(max_length=100, blank=True, null=True, verbose_name='资产型号')
    status = models.SmallIntegerField(blank=True, null=True, verbose_name='状态')
    put_zone = models.SmallIntegerField(blank=True, null=True, verbose_name='放置区域')
    group = models.SmallIntegerField(blank=True, null=True, verbose_name='使用组')
    business = models.SmallIntegerField(blank=True, null=True, verbose_name='业务类型')
    project = models.SmallIntegerField(blank=True, null=True, verbose_name='项目类型')
    host_vars = models.TextField(blank=True, null=True, verbose_name='ansible主机变量')
    mark = models.TextField(blank=True, null=True, verbose_name='资产标示')
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'opsmanage_assets'
        permissions = (
            ("can_read_assets", "读取资产权限"),
            ("can_change_assets", "更改资产权限"),
            ("can_add_assets", "添加资产权限"),
            ("can_delete_assets", "删除资产权限"),
            ("can_dumps_assets", "导出资产权限"),
        )
        verbose_name = '总资产表'
        verbose_name_plural = '总资产表'

    # 主机资产信息


class Server_Assets(models.Model):
    assets = models.OneToOneField('Assets')
    ip = models.CharField(max_length=100, unique=True, blank=True, null=True)
    hostname = models.CharField(max_length=100, blank=True, null=True)
    username = models.CharField(max_length=100, blank=True, null=True)
    passwd = models.CharField(max_length=100, blank=True, null=True)
    sudo_passwd = models.CharField(max_length=100, blank=True, null=True)
    keyfile = models.SmallIntegerField(blank=True,null=True)  # FileField(upload_to = './upload/key/',blank=True,null=True,verbose_name='密钥文件')
    port = models.DecimalField(max_digits=6, decimal_places=0, blank=True, null=True)
    line = models.SmallIntegerField(blank=True, null=True)
    cpu = models.CharField(max_length=100, blank=True, null=True)
    cpu_number = models.SmallIntegerField(blank=True, null=True)
    vcpu_number = models.SmallIntegerField(blank=True, null=True)
    cpu_core = models.SmallIntegerField(blank=True, null=True)
    disk_total = models.CharField(max_length=100, blank=True, null=True)
    ram_total = models.IntegerField(blank=True, null=True)
    kernel = models.CharField(max_length=100, blank=True, null=True)
    selinux = models.CharField(max_length=100, blank=True, null=True)
    swap = models.CharField(max_length=100, blank=True, null=True)
    raid = models.SmallIntegerField(blank=True, null=True)
    system = models.CharField(max_length=100, blank=True, null=True)
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)
    '''自定义添加只读权限-系统自带了add change delete三种权限'''

    class Meta:
        db_table = 'opsmanage_server_assets'
        permissions = (
            ("can_read_server_assets", "读取服务器资产权限"),
            ("can_change_server_assets", "更改服务器资产权限"),
            ("can_add_server_assets", "添加服务器资产权限"),
            ("can_delete_server_assets", "删除服务器资产权限"),
        )
        verbose_name = '服务器资产表'
        verbose_name_plural = '服务器资产表'




class Disk_Assets(models.Model):
    assets = models.ForeignKey('Assets')
    device_volume = models.CharField(max_length=100, blank=True, null=True, verbose_name='硬盘容量')
    device_status = models.CharField(max_length=100, blank=True, null=True, verbose_name='硬盘状态')
    device_model = models.CharField(max_length=100, blank=True, null=True, verbose_name='硬盘型号')
    device_brand = models.CharField(max_length=100, blank=True, null=True, verbose_name='硬盘生产商')
    device_serial = models.CharField(max_length=100, blank=True, null=True, verbose_name='硬盘序列号')
    device_slot = models.SmallIntegerField(blank=True, null=True, verbose_name='硬盘插槽')
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'opsmanage_disk_assets'
        permissions = (
            ("can_read_disk_assets", "读取磁盘资产权限"),
            ("can_change_disk_assets", "更改磁盘资产权限"),
            ("can_add_disk_assets", "添加磁盘资产权限"),
            ("can_delete_disk_assets", "删除磁盘资产权限"),
        )
        unique_together = (("assets", "device_slot"))
        verbose_name = '磁盘资产表'
        verbose_name_plural = '磁盘资产表'


class Ram_Assets(models.Model):
    assets = models.ForeignKey('Assets')
    device_model = models.CharField(max_length=100, blank=True, null=True, verbose_name='内存型号')
    device_volume = models.CharField(max_length=100, blank=True, null=True, verbose_name='内存容量')
    device_brand = models.CharField(max_length=100, blank=True, null=True, verbose_name='内存生产商')
    device_slot = models.SmallIntegerField(blank=True, null=True, verbose_name='内存插槽')
    device_status = models.CharField(max_length=100, blank=True, null=True, verbose_name='内存状态')
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'opsmanage_ram_assets'
        permissions = (
            ("can_read_ram_assets", "读取内存资产权限"),
            ("can_change_ram_assets", "更改内存资产权限"),
            ("can_add_ram_assets", "添加内存资产权限"),
            ("can_delete_ram_assets", "删除内存资产权限"),
        )
        unique_together = (("assets", "device_slot"))
        verbose_name = '内存资产表'
        verbose_name_plural = '内存资产表'


class NetworkCard_Assets(models.Model):
    assets = models.ForeignKey('Assets')
    device = models.CharField(max_length=20, blank=True, null=True)
    macaddress = models.CharField(u'MAC', max_length=64, blank=True, null=True)
    ip = models.GenericIPAddressField(u'IP', blank=True, null=True)
    module = models.CharField(max_length=50, blank=True, null=True)
    mtu = models.CharField(max_length=50, blank=True, null=True)
    active = models.SmallIntegerField(blank=True, null=True, verbose_name='是否在线')

    class Meta:
        db_table = 'opsmanage_networkcard_assets'
        verbose_name = '服务器网卡资产表'
        verbose_name_plural = '服务器网卡资产表'
        unique_together = (("assets", "macaddress"))



class Raid_Assets(models.Model):
    raid_name = models.CharField(max_length=100, unique=True)
    '''自定义权限'''

    class Meta:
        db_table = 'opsmanage_raid_assets'
        permissions = (
            ("can_read_raid_assets", "读取Raid资产权限"),
            ("can_change_raid_assets", "更改Raid资产权限"),
            ("can_add_raid_assets", "添加Raid资产权限"),
            ("can_delete_raid_assets", "删除Raid资产权限"),
        )
        verbose_name = 'Raid资产表'
        verbose_name_plural = 'Raid资产表'

class Log_Assets(models.Model):
    assets_id = models.IntegerField(verbose_name='资产类型id', blank=True, null=True, default=None)
    assets_user = models.CharField(max_length=50, verbose_name='操作用户', default=None)
    assets_content = models.CharField(max_length=100, verbose_name='名称', default=None)
    assets_type = models.CharField(max_length=50, default=None)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'opsmanage_log_assets'
        verbose_name = '项目配置操作记录表'
        verbose_name_plural = '项目配置操作记录表'

    # 项目部署

class Cron_Config(models.Model):
    cron_server = models.ForeignKey('Server_Assets')
    cron_minute = models.CharField(max_length=10, verbose_name='分', default=None)
    cron_hour = models.CharField(max_length=10, verbose_name='时', default=None)
    cron_day = models.CharField(max_length=10, verbose_name='天', default=None)
    cron_week = models.CharField(max_length=10, verbose_name='周', default=None)
    cron_month = models.CharField(max_length=10, verbose_name='月', default=None)
    cron_user = models.CharField(max_length=50, verbose_name='任务用户', default=None)
    cron_name = models.CharField(max_length=100, verbose_name='任务名称', default=None)
    cron_desc = models.CharField(max_length=200, blank=True, null=True, verbose_name='任务描述', default=None)
    cron_command = models.CharField(max_length=200, verbose_name='任务参数', default=None)
    cron_script = models.FileField(upload_to='./cron/', blank=True, null=True, verbose_name='脚本路径', default=None)
    cron_script_path = models.CharField(max_length=100, blank=True, null=True, verbose_name='脚本路径', default=None)
    cron_status = models.SmallIntegerField(verbose_name='任务状态', default=None)

    class Meta:
        db_table = 'opsmanage_cron_config'
        permissions = (
            ("can_read_cron_config", "读取任务配置权限"),
            ("can_change_cron_config", "更改任务配置权限"),
            ("can_add_cron_config", "添加任务配置权限"),
            ("can_delete_cron_config", "删除任务配置权限"),
        )
        verbose_name = '任务配置表'
        verbose_name_plural = '任务配置表'
        unique_together = (("cron_name", "cron_server", "cron_user"))


class Log_Cron_Config(models.Model):
    cron_id = models.IntegerField(verbose_name='id', blank=True, null=True, default=None)
    cron_user = models.CharField(max_length=50, verbose_name='操作用户', default=None)
    cron_name = models.CharField(max_length=100, verbose_name='名称', default=None)
    cron_content = models.CharField(max_length=100, default=None)
    cron_server = models.CharField(max_length=100, default=None)
    create_time = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='执行时间')

    class Meta:
        db_table = 'opsmanage_log_cron_config'
        verbose_name = '任务配置操作记录表'
        verbose_name_plural = '任务配置操作记录表'












#Ip 资源池
class IpSource(models.Model):
    ip=models.CharField(max_length=64,null=True,verbose_name=u"I P 地址",unique=True)
    subnet=models.CharField(max_length=64,verbose_name=u"子网地址",default=u'255.255.255.0',blank=True)
    gateway=models.CharField(max_length=64,null=True,blank=True,verbose_name=u"网关地址")
    is_active=models.BooleanField(verbose_name=u'0-离线ip,1-在线ip',default=1)
    beizhu=models.CharField(max_length=128,null=True,blank=True,verbose_name=u'备注信息')
    class Meta:
        verbose_name = u'总IP信息'
        verbose_name_plural = verbose_name
        db_table = u"IpSource"

    def __unicode__(self):
        return self.ip

ASSET_STATUS = (
        (str(1), u"使用中"),
        (str(2), u"未使用"),
        (str(3), u"故障"),
        (str(4), u"其它"),
    )

OEM = (
        (u"DELL", u"DELL"),
        (u"IBM", u"IBM"),
        (u"华为", u"华为"),
        (u"vmware", u"vmware"),
        (u"KVM", u"KVM"),
        (u"XEN", u"XEN")
    )

ASSET_TYPE = (
        (u"虚拟机", u"虚拟机"),
        (u"物理机", u"物理机"),
        (u'虚拟机宿主机', u'虚拟机宿主机'),
        (u"存储服务器", u"存储服务器"),
    )
#主机资源
class Host(models.Model):
    hostname = models.CharField(max_length=50, verbose_name=u"主机名")
    ip = models.GenericIPAddressField(u"访问IP", max_length=15,unique=True)
    ip_public = models.GenericIPAddressField(u"公网IP", max_length=15,null=True,blank=True)
    ip_control = models.GenericIPAddressField(u"远程管理卡IP", max_length=15,null=True,blank=True)
    ip_other = models.CharField(max_length=850,verbose_name=u'其他IP',blank=True,null=True)
    tree_id = models.ForeignKey(YewuTreeMptt, verbose_name=u"业务树ID", on_delete=models.SET_NULL, related_name='yewu_host', null=True, blank=True)
    asset_no = models.CharField(u"资产编号", max_length=50, null=True, blank=True)
    asset_type = models.CharField(u"设备类型", choices=ASSET_TYPE, max_length=30, null=True, blank=True)
    hostserver = models.CharField(verbose_name=u'宿主服务器', max_length=50, blank=True, null=True)
    status = models.CharField(u"使用状态", choices=ASSET_STATUS, max_length=30, null=True, blank=True)
    vendor = models.CharField(u"品牌型号", max_length=250, null=True, blank=True)
    cpu_model = models.CharField(u"CPU型号", max_length=100, null=True, blank=True)
    cpu_num = models.CharField(u"CPU核数", max_length=3, null=True, blank=True)
    memory = models.CharField(u"内存大小", max_length=30, null=True, blank=True)
    disk = models.CharField(u"硬盘信息", max_length=255, null=True, blank=True)
    sn = models.CharField(u"SN号 码", max_length=60,null=True, blank=True)
    idc = models.ForeignKey(Idc, verbose_name=u"所在机房", on_delete=models.SET_NULL, null=True, blank=True)
    cabinet = models.CharField(max_length=64, verbose_name=u'机柜', null=True, blank=True)
    location = models.CharField(u"机架位置", max_length=100, null=True, blank=True)
    uplink_port = models.CharField(max_length=256, verbose_name=u"上联端口", null=True, blank=True)
    useuser = models.CharField(verbose_name=u"使用者", null=True, blank=True,max_length=128)
    purpose = models.CharField(max_length=40,blank=True,verbose_name=u'用途')
    system_type = models.CharField(u'操作系统类型',max_length=50, null=True, blank=True)
    port = models.DecimalField(max_digits=6, decimal_places=0, blank=True, null=True,verbose_name=u"ssh登录的端口")
    username = models.CharField(max_length=32, blank=True,null=True, verbose_name=u"ssh登录的用户")
    passwd = models.CharField(max_length=64, blank=True,null=True, verbose_name=u"ssh登录的秘密", default="")
    sudo_passwd = models.CharField(max_length=100, blank=True, null=True)
    keyfile = models.SmallIntegerField(blank=True, null=True)
    ssh_status = models.IntegerField(default=0, verbose_name=u'用户连接状态,0-不可登陆,1-密码登陆,2-密钥登陆',blank=True,null=True)
    onlinedate = models.DateField( verbose_name=u'上线时间',default=u"2018-01-01")
    end_time = models.DateField(verbose_name=u"到保时间", default=u"2019-01-01")
    ctime = models.DateTimeField(auto_now_add=True, null=True, verbose_name=u'创建时间', blank=True)
    utime = models.DateTimeField(auto_now=True, null=True, verbose_name=u'更新时间', blank=True)
    is_pooled=models.BooleanField(verbose_name='是否在资源池中',default=True,blank=True) #在资源池中的数据才能被分配给业务,同时本资源移出资源池,不再在业务中和资源池中的
    memo = models.TextField(u"备注信息", max_length=200, null=True, blank=True)
    class Meta:
        verbose_name = u'主机资产'
        verbose_name_plural = verbose_name
        db_table = u"ALLHOSTS"
    def __unicode__(self):
        return self.ip

#主机分组
class HostGroup(models.Model):
    name = models.CharField(u"组名", max_length=30, unique=True)
    desc = models.CharField(u"描述", max_length=100, null=True, blank=True)
    serverList = models.ManyToManyField(Host,blank=True,verbose_name=u"包含服务器",related_name='group_host')
    def __unicode__(self):
        return self.name

#登陆失败的主机
class Host_fail(models.Model):
    '''
    '''
    ip = models.CharField(verbose_name=u"IP", max_length=30)
    is_active = models.BooleanField(verbose_name=u'0-不活动ip,1-活动ip', default=1)
    is_ssh = models.BooleanField(verbose_name=u'0-无ssh端口,1-有ssh端口', default=1)
    port = models.CharField(verbose_name=u"端口",max_length=7,blank=True,null=True)
    is_inhost=models.BooleanField(verbose_name=u'0-不在主机表,1-已在主机表', default=0)
    class Meta:
        verbose_name = u'登陆失败主机'
        verbose_name_plural = verbose_name
        db_table = "host_loginfail"

    def __unicode__(self):
        return self.ip



#扫描主机设置


class scan_host_conf(models.Model):
    nets = models.CharField(verbose_name=u"IP网段,如192.168.2", max_length=30,unique=True)
    nets_pass=models.CharField(verbose_name=u'本地址内不去扫描的地址，如 1，2，4，逗号隔开',max_length=200)
    port = models.CharField(verbose_name=u"端口,如6666,22", max_length=300,null=True,blank=True)
    ssh_pass = models.CharField(verbose_name=u'ssh 密码', max_length=300,null=True,blank=True)
    keys = models.CharField(verbose_name=u"keyfile", max_length=300,null=True,blank=True)
    beizhu = models.CharField(verbose_name=u"beizhu", max_length=40,null=True,blank=True)
    class Meta:
        db_table = 'scan_host_conf'

    def __unicode__(self):
        return self.nets


class scan_conf_ip(models.Model):
    nets = models.CharField(verbose_name=u"IP网段,如192.168.2", max_length=30,unique=True)
    nets_pass=models.CharField(verbose_name=u'本地址内不去扫描的地址，如 1，2，4，逗号隔开',max_length=100)
    port = models.CharField(verbose_name=u"端口,如6666,22", max_length=300,null=True,blank=True)
    ssh_pass = models.CharField(verbose_name=u'ssh 密码', max_length=300,null=True,blank=True)
    keys = models.CharField(verbose_name=u"keyfile", max_length=300,null=True,blank=True)
    class Meta:
        db_table = 'scan_conf_ip'

    def __unicode__(self):
        return self.nets




class scan_conf_port(models.Model):
    port = models.CharField(verbose_name=u"端口,如6666", max_length=300)
    class Meta:
        db_table = 'scan_conf_port'
    def __unicode__(self):
        return self.port


class scan_conf_sshpass(models.Model):
    ssh_pass = models.CharField(verbose_name=u'ssh 密码', max_length=300)

    class Meta:
        db_table = 'scan_conf_sshpass'

    def __unicode__(self):
        return self.ssh_pass

class scan_conf_keyfile(models.Model):
    '''
代码中第一个是rsa，第二个是dsa，第三个是非root用户，因此目前只用第一个就可以
    '''
    keys = models.CharField(verbose_name=u"keyfile ", max_length=300)

    class Meta:
        db_table = 'scan_conf_keyfile'

    def __unicode__(self):
        return self.keys


class scan_conf_cmd(models.Model):
    syscmd = models.CharField(verbose_name=u"执行的命令", max_length=300)

    class Meta:
        db_table = 'scan_conf_cmd'

    def __unicode__(self):
        return self.syscmd