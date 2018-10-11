# -*- coding: utf-8 -*-
from django.conf.urls import url,include


from deploy import (deploy_add,deploy_list,deploy_log,deploy_init,deploy_manage,deploy_modf,deploy_order_rollback,deploy_order_status,
deploy_result,deploy_run,deploy_version )


urlpatterns = [
    url(r'^deploy_add', deploy_add),
    url(r'^deploy_list', deploy_list),
    url(r'^deploy_log/(?P<page>[0-9]+)/$', deploy_log),
    url(r'^deploy_mod/(?P<pid>[0-9]+)/$', deploy_modf),
    url(r'^deploy_init/(?P<pid>[0-9]+)/$', deploy_init),
    url(r'^deploy_version/(?P<pid>[0-9]+)/$', deploy_version),
    url(r'^deploy_run/(?P<pid>[0-9]+)/$', deploy_run),
    url(r'^deploy_result/(?P<pid>[0-9]+)/$', deploy_result),
    url(r'^deploy_order/status/(?P<pid>[0-9]+)/$', deploy_order_status),
    url(r'^deploy_order/rollback/(?P<pid>[0-9]+)/$', deploy_order_rollback),
    url(r'^deploy_manage/(?P<pid>[0-9]+)/$', deploy_manage),
]