from django.conf.urls import url
from django.contrib import admin
from yewu_tree import yewu_tree,yewu_mysql,yewu_oracle,yewu_server
# from views.net import  netdevice,group_net,idc_net
from CMDB.views.idc import idc,idc_add,idc_del,idc_edit,idc_save
urlpatterns = [


    url('^idc',idc,name='idc_list'),
    url(r'^idc/add/$', idc_add, name='idc_add'),
    url(r'^idc/del/$', idc_del, name='idc_del'),
    url(r'^idc/save/$', idc_save, name='idc_save'),
    url(r'^idc/edit/(?P<id>[0-9]+)/$', idc_edit, name='idc_edit'),

    url('^yewutree',yewu_tree,name='yewu_tree'),
    url('^yewu_mysql', yewu_mysql, name='yewu_mysql'),
    url('^yewu_oracle', yewu_oracle, name='yewu_oracle'),
    url('^yewu_server', yewu_server, name='yewu_server'),

    # url(r'^netasset/full$', netdevice.netasset, name='netasset_full'),
    # url(r'^netasset/add/$', netdevice.asset_add, name='netasset_add'),
    # url(r'^netasset/del/$', netdevice.asset_del, name='netasset_del'),
    # url(r'^netasset/edit/(?P<ids>\d+)/$', netdevice.asset_edit, name='netasset_edit'),
    # # url(r'^asset/save/$', asset.asset_save, name='asset_save'),
    # url(r'^netgroup/$', group_net.group, name='group_net'),
    # url(r'^netgroup/del/$', group_net.group_del, name='group_net_del'),
    # url(r'^netgroup/add/$', group_net.group_add, name='group_net_add'),
    # url(r'^netgroup/edit/(?P<ids>\d+)/$', group_net.group_edit, name='group_net_edit'),
    # url(r'^netgroup/save/$', group_net.group_save, name='group_net_save'),
    # url(r'^netidc/$', idc_net.idc, name='idc_net'),
    # url(r'^netidc/add/$', idc_net.idc_add, name='idc_net_add'),
    # url(r'^netidc/del/$', idc_net.idc_del, name='idc_net_del'),
    # url(r'^netidc/save/$', idc_net.idc_save, name='idc_net_save'),
    # url(r'^netidc/edit/(?P<ids>\d+)/$', idc_net.idc_edit, name='idc_net_edit'),
    #

]