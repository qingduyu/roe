# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from CMDB.model.yewutree_model import YewuTree
from django.contrib.auth.models import User

RedisARCH=(
    (u"哨兵",u"哨兵"),
    (u"单机",u"单击"),
    (u"cluster",u"cluster"),
)
REDIS_ROLE = (
    (u"单库", u"单库"),
    (u"主库", u"主库"),
    (u"从库", u"从库"),

    )


REDIS_STATUS = (
    (u"使用中", u"使用中"),
    (u"仅备用", u"仅备用"),
    (u"故障", u"故障"),
    (u"其它", u"其它"),
    )

#
#
#
#
# #群，一定属于某一个产品线,可能属于多个，一个节点也是群
# class RedistCluster(models.Model):
#     name = models.CharField(u"集群名", max_length=30, blank=True,null=True)
#     arch = models.CharField(verbose_name=u"集群架构", choices=RedisARCH,max_length=30, null=True, blank=True)
#     db_version = models.CharField(verbose_name=u"数据库版本",  max_length=30, null=True, blank=True)
#     auth=models.CharField(verbose_name=u"数据库密码",  max_length=30, null=True, blank=True)
#     tree_id=models.ManyToManyField(YewuTree,verbose_name=u"所属产品线", null=True, blank=True)
#     desc = models.CharField(u"描述", max_length=100, null=True, blank=True)
#     operator=models.ForeignKey(User,verbose_name=u"可操作的人", blank=True,null=True)
#     def __unicode__(self):
#         return self.name
#
#
# #数据库中的 DB，表空间信息
# class Redisdb(models.Model):
#         dbname = models.CharField(max_length=50,verbose_name=u"数据库")
#         dbcluster = models.ForeignKey(RedistCluster,verbose_name=u"所属集群", on_delete=models.SET_NULL, null=True, blank=True)
#         keys_number=models.CharField(max_length=50,verbose_name=u"keys数量")
#
#         def __unicode__(self):
#             return u'%s ' % ( self.dbname)
# #
#
# #redis 实例信息，配置参数慢慢添加
# class Redis_Instance(models.Model):
#     dbtag = models.CharField(max_length=50, verbose_name=u"数据库标志", blank=True,null=True)
#     vist_ip = models.GenericIPAddressField(verbose_name=u"访问VIP", max_length=15)
#     m_ip =  models.GenericIPAddressField(verbose_name=u"管理IP", max_length=15)
#     port = models.IntegerField(verbose_name=u"端口",default=6379)
#     idc = models.CharField(max_length=30, verbose_name=u"机房",  null=True, blank=True)
#     dbcluster = models.ForeignKey(RedistCluster, verbose_name=u"所属集群", on_delete=models.SET_NULL, null=True, blank=True)
#     role = models.CharField(verbose_name=u"DB角色", choices=REDIS_ROLE, max_length=30, null=True, blank=True)
#     db_status = models.CharField(verbose_name=u"DB状态", choices=REDIS_STATUS, max_length=30, null=True, blank=True)
#     memory = models.CharField(u"分配内存", max_length=30, null=True, blank=True)
#     disk = models.CharField(u"磁盘位置", max_length=200, null=True, blank=True)
#     memo = models.TextField(u"备注信息", max_length=200, null=True, blank=True)
#     def __unicode__(self):
#         return self.dbtag