#! /usr/bin/env python
# -*- coding: utf-8 -*-
# __author__ = "Q1mi"
# Date: 2017/10/3


from rest_framework import serializers
from test.models import *


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


class PublisherSerializer(serializers.ModelSerializer):
    operator = serializers.ReadOnlyField(source="operator.username")

    class Meta:
        model = Publisher
        fields = (
            "id",
            "name",
            "address",
            "operator"
        )


class BookSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Book
        fields = (
            "id",
            "title",
            "publisher"
        )