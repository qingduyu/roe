# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.contrib.auth.models import User

class UserProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE) #使用自带的用户管理模块进行管理
    real_name = models.CharField(max_length=32)
    phone=models.CharField(max_length=12,null=True)
    roles=models.ManyToManyField('Role',blank=True)

    def __str__(self):
        return self.real_name


class Role(models.Model):
    """角色表"""
    name=models.CharField(unique=True,max_length=32)
    menus=models.ManyToManyField('Menus')

    def __str__(self):
        return self.name



class Menus(models.Model):
    title=models.CharField(max_length=32,verbose_name=u'菜单名')
    parent=models.ForeignKey('self',verbose_name='父级菜单',null=True,blank=True,default=0,help_text=u'如果添加的是子菜单，请选择父菜单')
    parent_copy = models.IntegerField( verbose_name=u'父级菜单拷贝', blank=True, null=True,help_text='顶级菜单设置为-1,为了treetable')
    show=models.BooleanField(verbose_name=u'是否显示',default=False,help_text=u'菜单是否显示，默认不显示')
    spread=models.BooleanField(verbose_name=u'是否展开',default=False)
    href=models.CharField(max_length=300,verbose_name=u'菜单地址',null=True,blank=True,default='javascript:void(0)',help_text=u'给菜单设置一个url地址')
    priority = models.IntegerField(verbose_name=u'显示优先级',null=True,blank=True,help_text=u'菜单的显示顺序,优先级越大显示越靠前')
    target=models.CharField(max_length=32,verbose_name=u'打开方式',null=True,blank=True,help_text=u"如果是新打开则填写,__blank")
    icon=models.CharField(max_length=32,verbose_name=u'图标代码',null=True,blank=True)

    def __str__(self):
        return '{parent}{name}'.format(name=self.title,parent="%s--->" % self.parent.title if self.parent else '')

    class Meta:
        verbose_name=u'Menus'
        verbose_name_plural=u'Menus'


