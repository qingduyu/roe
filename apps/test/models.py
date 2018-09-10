#! /usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals
from django.db import models

class Publisher(models.Model):
    name = models.CharField(max_length=32, verbose_name="名称", unique=True)
    address = models.CharField(max_length=128, verbose_name="地址")
    operator = models.ForeignKey("auth.User",blank=True,null=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table='test_publisher'
        verbose_name = u"出版社"
        verbose_name_plural = verbose_name


class Book(models.Model):
    title = models.CharField(max_length=32, verbose_name="书名")
    publisher = models.ForeignKey("Publisher")

    def __str__(self):
        return self.title

    class Meta:
        db_table='test_book'
        verbose_name = u"书"
        verbose_name_plural = verbose_name


class Auth(models.Model):
    name=  models.CharField(max_length=32, verbose_name="作者名")
    book= models.ManyToManyField(Book,related_name='books',related_query_name='authors',help_text='书籍和作者多对多的关系')