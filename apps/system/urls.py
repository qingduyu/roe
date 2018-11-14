#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.conf.urls import url
from system.views.menuops import  menulist,getmulist,getlarrymenus
from views.users import user_manage,register,user,group,rolelist
from views.user_api import group_list,group_detail,role_list
from views.filemanage import file_download_run,file_downloads,file_upload_run

from system.views.webssh import webssh_list,webssh
urlpatterns = [
    url('^menuops',menulist,name='menulist'),
    url('^getmenulist',getmulist,name='getmenulist'),
    url('^getlarrymenu', getlarrymenus, name='getlarrymenu'),
    url(r'^users/manage$',user_manage,name='user_manage'),
    url(r'^register/',register,name='user_register'),
    url(r'^user/(?P<uid>[0-9]+)/$',user,name='user_setting'),
    # url(r'^role/(?P<id>[0-9]+)/$', role,name='user_role'),
    url(r'^users/rolelist/$', rolelist, name='rolelist'),
    url(r'^group/(?P<gid>[0-9]+)/$',group,name='group_setting'),
    url(r'^api/group/$', group_list,name='group_list_api'),
    url(r'^api/group/(?P<id>[0-9]+)/$',group_detail,name='group_detail_api'),


    url(r'^api/rolelist/',role_list,name='api_rolelist'),


#文件管理
    url(r'^upload/run/(?P<id>[0-9]+)/$', file_upload_run),
    url(r'^download/run/(?P<id>[0-9]+)/$', file_download_run),
    url(r'^downloads/$', file_downloads),

    url(r'^webssh/(?P<sid>[0-9]+)/$', webssh,name='webssh'),
    url(r'^websshlist/$', webssh_list,name='webssh_list'),
]