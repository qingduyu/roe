#! /usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import url,include
from django.contrib import admin


from rest_framework import routers, serializers, viewsets
router = routers.DefaultRouter()

# router.register(r'idcapi', IdcViewset,base_name='api_idc')
from views import *

router.register(r'1books', BookViewSet,base_name='api_books')
router.register(r'1publishers', PublisherViewSet,base_name='api_publisher')


urlpatterns = [
    url(r'^api/', include(router.urls)),
    url(r'^test_single/$',test_single,name='test_single'),
    url(r'^test_single_add/$', test_single_add, name='test_single_add'),
    url(r'^test_single_edit/(?P<id>[0-9]+)/$', test_single_edit, name='test_single_edit'),
    url(r'^test_single_page/$', test_single_page, name='test_single'),

    url(r'^publishers/$', PublisherList.as_view()),
    url(r'^publishers_page/$', PublisherListPage.as_view(),name='api_test_publisersh_page'),#分页功能

    url(r'^publishers_detail/(?P<id>[0-9]+)/$', PublisherDetail.as_view()),
    url(r'del_publisher/$',Del_Publisher.as_view()),
    # url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
]


