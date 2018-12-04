#! /usr/bin/env python
#-*- coding: utf-8 -*-

from __future__ import unicode_literals
from CMDB.model.yewutree_model import YewuTreeMptt
from django.contrib.auth.models import User
from CMDB.model.idc_models import Idc

from django.db import models


#









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