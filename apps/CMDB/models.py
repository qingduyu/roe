# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from CMDB.model.yewutree_model import YewuTreeMptt,Productline

from CMDB.model.net_models import NetGroup,NetDevice
from CMDB.model.idc_models import Idc

#导入oracle表
from CMDB.model.oracle_modles import OracleCluster,Oracletablespace,Oracle_Instance,OracleUser

#导入mysql表
from CMDB.model.mysql_modles import MySQLCluster, Mysql_db,MySQL_Instance,Mysql_User

#导入服务器表

from CMDB.model.server_models import Host,IpSource,Host_fail,HostGroup
