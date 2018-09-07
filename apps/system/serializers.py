#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from rest_framework import serializers
from system.models import UserProfile, Role

from django.contrib.auth.models import Group, User

#组表
class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('id', 'name')


#角色表
class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        fields = ('id', 'name','desc','status')

#用户表
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'last_login', 'is_superuser', 'username',
                  'first_name', 'last_name', 'email', 'is_staff',
                  'is_active', 'date_joined')
