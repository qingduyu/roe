# !/usr/bin/env python
# _#_ coding:utf-8 _*_
from django.conf.urls import url,include
from django.contrib import admin
from yewu_tree import yewu_tree,yewu_huizong,yewu_tree_add_branch,yewu_tree_add_leaf,yewu_tree_delete,yewu_tree_edit_branch,yewu_tree_edit_leaf,yewutree2
from yewu_tree import yewu_host_add,yewu_server,yewu_host_free
from yewu_tree import yewu_mysql
from yewu_tree import yewu_oracle,yewu_mongo,yewu_redis

from yewu_tree_api import get_treehost,get_jsontree,YewuHost_API,YewuHost_free_API

# from views.net import  netdevice,group_net,idc_net
from CMDB.views.idc import idc_show,idc_add,idc_edit
from CMDB.views.idc_api import IDCAPI
from CMDB.views.db.oracle import oracle_cluster, oracle_cluster_instance, oracle_cluster_tablespace, oracle_cluster_user
from CMDB.views.db.oracle_api import OracleClusterAPI

from CMDB.views.db.mysql import (mysql_cluster,mysql_cluster_instance, mysql_cluster_db,mysql_cluster_user,
                                 mysql_cluster_add,mysql_cluster_edit,mysql_cluster_db_add,mysql_cluster_db_edit,
                                 mysql_cluster_instance_add,mysql_cluster_instance_edit,mysql_cluster_user_add,mysql_cluster_user_edit,
                                 )
from CMDB.views.db.mysql_api import MysqlClusterAPI,MysqlDBAPI,MysqlInstanceAPI,MySQLUserAPI,Mysql_DO_API

from CMDB.views.server.scan_conf import scan_host_conf_list,scan_host_conf_add,scan_host_conf_edit,scan_host_ip_add,scan_host_ip_del,scan_host_conf_upate
from CMDB.views.server.scan_conf_api import ScanHostConfAPI

from CMDB.views.server.scan_ip import scan_ip,scan_ip_edit
from CMDB.views.server.scan_ip_api import IPAPI
from CMDB.views.server.scan_host import scan_host,scan_host_edit
from CMDB.views.server.host_api import HOST_API,HOSTFail_API,WuLiHOST_API,XuNiHOST_API,SuZhuHOST_API

from CMDB.views.server.virtual_host import xunihost_show,xunihost_add,xunihost_edit,xunihost_detail
from CMDB.views.server.physical_host import wulihost_show,wulihost_add,wulihost_edit,wulihost_detail
from CMDB.views.server.suzhu_host import suzhuhost_show,suzhuhost_add,suzhuhost_edit,suzhuhost_detail
from CMDB.views.server.host_api import ansible_facts

urlpatterns = [

    url('^idc_show',idc_show,name='idc_show'),
    url(r'^idc/add/$', idc_add, name='idc_add'),
    url(r'^idc/edit/(?P<id>[0-9]+)$', idc_edit, name='idc_edit'),
    url(r'^idc/api/idc/$',IDCAPI.as_view(),name='api_idc'),

############################以下是mysql 资产相关url
    url(r'^db/mysql_cluster/$',mysql_cluster,name='cmdb_mysql_cluster'),
    url(r'^db/mysql_cluster/add/$', mysql_cluster_add, name='cmdb_mysql_cluster_add'),
    url(r'^db/mysql_cluster/edit/(?P<id>[0-9]+)$', mysql_cluster_edit, name='cmdb_mysql_cluster_edit'),
    url(r'^db/api/mysql_cluster/$',MysqlClusterAPI.as_view(),name='api_mysql_cluster'),
    url(r'^db/api/mysql_do_update/$',Mysql_DO_API.as_view(),name='api_mysql_do_update'),


    url(r'^db/mysql_instance/$', mysql_cluster_instance, name='cmdb_mysql_instance'),
    url(r'^db/mysql_instance/add/$', mysql_cluster_instance_add, name='cmdb_mysql_instance_add'),
    url(r'^db/mysql_instance/edit/(?P<id>[0-9]+)$', mysql_cluster_instance_edit, name='cmdb_mysql_instance_edit'),
    url(r'^db/api/mysql_instance/$', MysqlInstanceAPI.as_view(), name='api_mysql_instance'),

    url(r'^db/mysql_user$', mysql_cluster_user, name='cmdb_mysql_user'),
    url(r'^db/mysql_user/add$', mysql_cluster_user_add, name='cmdb_mysql_user_add'),
    url(r'^db/mysql_user/edit/(?P<id>[0-9]+)$', mysql_cluster_user_edit, name='cmdb_mysql_user_edit'),
    url(r'^db/api/mysql_user/$', MySQLUserAPI.as_view(), name='api_mysql_user'),

    url(r'^db/mysql_db$', mysql_cluster_db, name='cmdb_mysql_db'),
    url(r'^db/mysql_db/add$', mysql_cluster_db_add, name='cmdb_mysql_db_add'),
    url(r'^db/mysql_db/edit/(?P<id>[0-9]+)$', mysql_cluster_db_edit, name='cmdb_mysql_db_edit'),
    url(r'^db/api/mysql_db/$', MysqlDBAPI.as_view(), name='api_mysql_db'),

    ##########################这里是oracle资产相关####################
    url(r'^db/oracle_cluster/$', oracle_cluster, name='oracle_cluster'),
    url(r'^db/oracle_user/$', oracle_cluster_user, name='oracle_cluster_user'),
    url(r'^db/oracle_tablespace/$', oracle_cluster_tablespace, name='oracle_cluster_tablespace'),
    url(r'^db/oracle_instance/$', oracle_cluster_instance, name='oracle_cluster_instance'),

    url(r'^oracle_cluster_api/$', OracleClusterAPI.as_view(), name='api_oracle_cluster'),

    #########################业务树相关
    url('^yewutree$',yewu_tree,name='yewu_tree'),
    url(r'^yewutree/addbranch/$', yewu_tree_add_branch, name='yewu_tree_add_branch'),
    url(r'^yewutree/addleaf/$', yewu_tree_add_leaf, name='yewu_tree_add_leaf'),
    url(r'^yewutree/editbranch/$', yewu_tree_edit_branch, name='yewu_tree_edit_branch'),
    url(r'^yewutree/editleaf/$', yewu_tree_edit_leaf, name='yewu_tree_edit_leaf'),
    url(r'^yewutree/delete/$', yewu_tree_delete, name='yewu_tree_delete'),


    url('^yewu_mysql/$', yewu_mysql, name='yewu_mysql'),
    url('^yewu_oracle/$', yewu_oracle, name='yewu_oracle'),


    url('^yewu_redis/$', yewu_redis, name='yewu_redis'),
    url('^yewu_mongo/$', yewu_mongo, name='yewu_mongo'),

    # url('^yewu_tomcat/$', yewu_oracle, name='yewu_tomcat'),

    url('^yewu_host/$', yewu_server, name='yewu_host'),
    url('^yewu_host_add/(?P<id>[0-9]+)/$', yewu_host_add, name='yewu_host_add'),
    url('^yewu_huizong/$', yewu_huizong, name='yewu_huizong'),
    url('^yewu_host_api/$',YewuHost_API.as_view() , name='cmdb_yewu_host_api'),

    url('^yewu_host_free/$', yewu_host_free, name='cmdb_yewu_host_free'),
    url('^yewu_host_free_api/$', YewuHost_free_API.as_view(), name='cmdb_yewu_host_free_api'),
    url('^get_json_tree/$',get_jsontree, name='get_json_tree'),
    url('^get_json_tree_host/(?P<id>[0-9]+)/$', get_treehost, name='get_json_tree_host'),





##############自动扫描相关,新主机资产#######
    url(r'^scan/host/conf$',scan_host_conf_list,name='scan_host_conf'),
    url(r'^scan/host/conf/add$', scan_host_conf_add, name='scan_host_conf_add'),
    url(r'^scan/host/conf/edit/(?P<id>[0-9]+)', scan_host_conf_edit, name='scan_host_conf_edit'),
    url(r'^scan/host/conf_upate/$',scan_host_conf_upate,name='scan_host_conf_update'),
    url(r'^scan/host/conf/ip_del/(?P<id>[0-9]+)$', scan_host_ip_del, name='scan_conf_ip_del'),
    url(r'^scan/host/conf/ip_add/$', scan_host_ip_add, name='scan_conf_ip_add'),
    url(r'^scan/host/conf/ip_del/(?P<id>[0-9]+)$', scan_host_ip_del, name='scan_conf_ip_del'),
    url(r'^scan/host/conf/api/$', ScanHostConfAPI.as_view(), name='scan_host_conf_api'),

    url(r'^scan/ip/scan/$', scan_ip, name='cmdb_scan_ip'),
    url(r'^scan/ip/edit/$', scan_ip_edit, name='cmdb_scan_ip_edit'),
    url(r'^ipresource/api/$',IPAPI.as_view(),name='cmdb_ip_api'),

    url(r'^scan/host/scan/$', scan_host, name='cmdb_scan_host'),
    url(r'^scan/host/edit/(?P<id>[0-9]+)$', scan_host_edit, name='cmdb_scan_host_edit'),
    url(r'^host/api/$', HOST_API.as_view(), name='cmdb_host_api'),
    url(r'^hostfail/api/$', HOSTFail_API.as_view(), name='cmdb_hostfail_api'),
    url(r'^host_ansible_facts/$',ansible_facts,name='host_ansible_facts'),

    url(r'^suzhuhost/list/$', suzhuhost_show, name='cmdb_suzhuhost_show'),
    url(r'^suzhuhost/add/$', suzhuhost_add, name='cmdb_suzhuhost_add'),
    url(r'^suzhuhost/edit/$', suzhuhost_edit, name='cmdb_suzhuhost_edit'),
    url(r'^suzhuhost/detail/$', suzhuhost_detail, name='cmdb_suzhuhost_detail'),
    url(r'^suzhuhost/api/$', SuZhuHOST_API.as_view(), name='cmdb_suzhuhost_api'),

    url(r'^wulihost/list/$', wulihost_show, name='cmdb_wulihost_show'),
    url(r'^wulihost/add/$', wulihost_add, name='cmdb_wulihost_add'),
    url(r'^wulihost/edit/$', wulihost_edit, name='cmdb_wulihost_edit'),
    url(r'^wulihost/detail/$', wulihost_detail, name='cmdb_wulihost_detail'),
    url(r'^wulihost/api/$', WuLiHOST_API.as_view(), name='cmdb_wulihost_api'),

    url(r'^xunihost/list/$',xunihost_show,name='cmdb_xunihost_show'),
    url(r'^xunihost/add/$', xunihost_add, name='cmdb_xunihost_add'),
    url(r'^xunihost/edit/$', xunihost_edit, name='cmdb_xunihost_edit'),
    url(r'^xunihost/detail/$', xunihost_detail, name='cmdb_xunihost_detail'),
    url(r'^xunihost/api/$', XuNiHOST_API.as_view(), name='cmdb_xunihost_api'),


##################
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