# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from mptt.models import MPTTModel,TreeForeignKey

from CMDB.model.yewutree_model import YewuTree,Productline

from CMDB.model.net_models import NetGroup,NetDevice,Network_Assets
from CMDB.model.idc_models import Idc,Zone_Assets,Line_Assets

#导入oracle表
from CMDB.model.oracle_modles import OracleCluster,Oracletablespace,Oracle_Instance,OracleUser

#导入mysql表
from CMDB.model.mysql_modles import MySQLCluster, Mysql_db,MySQL_Instance,Mysql_User

#导入服务器表

from CMDB.model.server_models import Host,IpSource,Host_fail,HostGroup,Assets,Server_Assets,Disk_Assets,Log_Assets,Raid_Assets,NetworkCard_Assets,Ram_Assets,Log_Cron_Config,Cron_Config
