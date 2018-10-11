#! /usr/bin/env python
# -*- coding: utf-8 -*-
# __author__ = "Q1mi"
# Date: 2017/10/3


from rest_framework import serializers
from test.models import *
from system.serializers import UserSerializer


# class PublisherSerializer(serializers.Serializer):
#     id = serializers.IntegerField(read_only=True)
#     name = serializers.CharField(max_length=32)
#     address = serializers.CharField(max_length=128)
#
#     def create(self, validated_data):
#         return models.Publisher.objects.create(**validated_data)
#
#     def update(self, instance, validated_data):
#         instance.name = validated_data.get("name", instance.name)
#         instance.address = validated_data.get("address", instance.address)
#         instance.save()
#         return instance

class Publisher_read_serializer(serializers.ModelSerializer):
    #实验证明，在有外见的子段情况下，不能把子段设置为"__all__",必须要写全子段，并且显示的子段要设置
    operator = serializers.ReadOnlyField(source="operator.username")
    class Meta:
        model = Publisher
        fields=("id",'name','address','operator')

class Publisher_write_Serializer(serializers.ModelSerializer):
    # operator = serializers.CharField(source="operator.username",read_only=True)
    # operator=UserSerializer(read_only=True,many=True)
    class Meta:
        model = Publisher
        # fields = (
        #     "id",
        #     "name",
        #     "address",
        #     "operator"
        # )
        fields="__all__"


class BookSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Book
        fields = (
            "id",
            "title",
            "publisher"
        )