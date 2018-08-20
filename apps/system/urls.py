from django.conf.urls import url
from system.views.menuops import  menulist,getmulist
from views.users import user_manage,register,user,group,role
from views.user_api import group_list,group_detail
urlpatterns = [
    url('^menuops',menulist,name='menulist'),
    url('^getmenulist',getmulist,name='getmenulist'),

    url(r'^users/manage$',user_manage,name='user_manage'),
    url(r'^register/',register,name='user_register'),
    url(r'^user/(?P<uid>[0-9]+)/$',user,name='user_setting'),
    url(r'^role/(?P<id>[0-9]+)/$', role,name='user_role'),
    url(r'^group/(?P<gid>[0-9]+)/$',group,name='group_setting'),
    url(r'^api/group/$', group_list,name='group_list_api'),
    url(r'^api/group/(?P<id>[0-9]+)/$',group_detail,name='group_detail_api'),
]