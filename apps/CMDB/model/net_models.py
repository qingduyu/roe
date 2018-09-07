# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from mptt.models import MPTTModel,TreeForeignKey

from CMDB.model.idc_models import Idc
from CMDB.model.server_models import Assets

#网络分组
class NetGroup(models.Model):
    name = models.CharField(u"组名", max_length=30, unique=True)
    desc = models.CharField(u"描述", max_length=100, null=True, blank=True)

    def __unicode__(self):
        return self.name

#Net资源(带内，带外，互联IP)
class NetDevice(models.Model):
    OEM = (
        (str(1), u"juniper"),
        (str(2), u"华三"),
        (str(3), "华为"),
        (str(4), u"思科"),
        (str(5), u"博科"),
        (str(6), u"深信服"),
        (str(7), u"IBM"),
        (str(8), u"TP-LINK"),
        (str(9), u"锐捷"),
    )
    ASSET_TYPE = (
        (str(1), u"路由器"),
        (str(2), u"交换机"),
        (str(3), u"防火墙"),
        (str(4), u"加密机"),
    )

    ASSET_STATUS = (
        (str(1), u"使用中"),
        (str(2), u"未使用"),
        (str(3), u"故障"),
        (str(4), u"其它"),
    )

    devicename = models.CharField(max_length=50, verbose_name=u"设备名", unique=True)
    in_band_ip = models.GenericIPAddressField(u"带内IP", max_length=15,null=True,blank=True)
    out_band_ip = models.CharField(u"带外IP", max_length=200, null=True, blank=True)
    in_net_ip = models.CharField(u"互联IP", max_length=200, null=True, blank=True)
    group = models.ForeignKey(NetGroup, verbose_name=u"设备组", on_delete=models.SET_NULL, null=True, blank=True)
    asset_no = models.CharField(u"资产编号", max_length=50, null=True, blank=True)
    asset_type = models.CharField(u"设备类型", choices=ASSET_TYPE, max_length=30, null=True, blank=True)
    status = models.CharField(u"使用状态", choices=ASSET_STATUS, max_length=30, null=True, blank=True,default='1')
    brand = models.CharField(u"品牌", choices=OEM,max_length=50, null=True, blank=True)
    brand_model= models.CharField(u"型号",max_length=150, null=True, blank=True)
    sn = models.CharField(u"SN号 码", max_length=60,null=True, blank=True)
    idc = models.ForeignKey(Idc, verbose_name=u"所在机房", on_delete=models.SET_NULL, null=True, blank=True)
    cabinet = models.CharField(u"机柜", max_length=100, null=True, blank=True)
    location = models.CharField(u"机架", max_length=100, null=True, blank=True)
    useuser = models.CharField(verbose_name=u"管理员", null=True, blank=True,max_length=50)
    purpose = models.CharField(max_length=140,blank=True,verbose_name=u'用途')
    soft_version = models.CharField(u'软件版本',max_length=50, null=True, blank=True)
    url = models.URLField(max_length=100, blank=True, verbose_name=u'访问URL')
    username = models.CharField(max_length=20, blank=True, verbose_name=u'用户名')
    password = models.CharField(max_length=50, blank=True, verbose_name=u'密码')
    onlinedate=models.DateField(u"上线时间", max_length=50, default='2018-01-01',null=True, blank=True)
    memo = models.TextField(u"备注信息", max_length=200, null=True, blank=True)

    def __unicode__(self):
        return self.devicename

    class Meta:
        db_table = 'NetDevices'
        verbose_name = '网络设备'
        verbose_name_plural = '网络设备'

class Network_Assets(models.Model):
    assets = models.OneToOneField('Assets')
    bandwidth =  models.CharField(max_length=100,blank=True,null=True,verbose_name='背板带宽')
    ip = models.CharField(unique=True,max_length=100,blank=True,null=True,verbose_name='管理ip')
    username = models.CharField(max_length=100,blank=True,null=True)
    passwd = models.CharField(max_length=100,blank=True,null=True)
    sudo_passwd = models.CharField(max_length=100,blank=True,null=True)
    port = models.DecimalField(max_digits=6,decimal_places=0,blank=True,null=True)
    port_number = models.SmallIntegerField(blank=True,null=True,verbose_name='端口个数')
    firmware =  models.CharField(max_length=100,blank=True,null=True,verbose_name='固件版本')
    cpu = models.CharField(max_length=100,blank=True,null=True,verbose_name='cpu型号')
    stone = models.CharField(max_length=100,blank=True,null=True,verbose_name='内存大小')
    configure_detail = models.TextField(max_length=100,blank=True,null=True,verbose_name='配置说明')
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)
    class Meta:
        db_table = 'opsmanage_network_assets'
        permissions = (
            ("can_read_network_assets", "读取网络资产权限"),
            ("can_change_network_assets", "更改网络资产权限"),
            ("can_add_network_assets", "添加网络资产权限"),
            ("can_delete_network_assets", "删除网络资产权限"),
        )
        verbose_name = '网络资产表'
        verbose_name_plural = '网络资产表'
