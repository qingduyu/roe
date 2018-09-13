from django.conf.urls import url,include
from django.contrib import admin
# from yewu_tree import yewu_tree,yewu_mysql,yewu_oracle,yewu_server
# from views.net import  netdevice,group_net,idc_net
from CMDB.views.idc import idc_show,idc_add,idc_edit
from CMDB.views.idc_api import IDCAPI
from CMDB.views.db.oracle import *
from CMDB.views.db.oracle_api import OracleClusterAPI
from CMDB.views import assets



urlpatterns = [

    url('^idc_show',idc_show,name='idc_show'),
    url(r'^idc/add/$', idc_add, name='idc_add'),
    url(r'^idc/edit/(?P<id>[0-9]+)$', idc_edit, name='idc_edit'),
    url(r'^idc/api/idc/$',IDCAPI.as_view(),name='api_idc'),

    url(r'^db/oracle_cluster/$', oracle_cluster, name='oracle_cluster'),
    url(r'^db/oracle_user/$', oracle_cluster_user, name='oracle_cluster_user'),

    url(r'^oracle_cluster_api/$',OracleClusterAPI.as_view(),name='api_oracle_cluster'),

    # url('^yewutree',yewu_tree,name='yewu_tree'),
    # url('^yewu_mysql', yewu_mysql, name='yewu_mysql'),
    # url('^yewu_oracle', yewu_oracle, name='yewu_oracle'),
    # url('^yewu_server', yewu_server, name='yewu_server'),


    url(r'^assets_config',assets.assets_config),
    url(r'^assets_add',assets.assets_add,name='cmdb_assets_add'),
    url(r'^assets_list',assets.assets_list),
    url(r'^assets_mod/(?P<aid>[0-9]+)/$',assets.assets_modf),
    url(r'^assets_view/(?P<aid>[0-9]+)/$',assets.assets_view),
    url(r'^assets_facts',assets.assets_facts,name='cmdb_assets_facts'),
    url(r'^assets_log/(?P<page>[0-9]+)/$',assets.assets_log),
    url(r'^assets_import/',assets.assets_import),
    url(r'^assets_search/',assets.assets_search),
    url(r'^assets_server/',assets.assets_server),
    url(r'^assets/batch/update/',assets.assets_update),
    url(r'^assets/batch/delete/',assets.assets_delete),
    url(r'^assets/batch/dumps/',assets.assets_dumps),
    url(r'^assets/groups/(?P<id>[0-9]+)/$',assets.assets_groups),

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