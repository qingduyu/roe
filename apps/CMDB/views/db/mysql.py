#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from CMDB.model.mysql_modles import MySQL_Instance,Mysql_db,Mysql_User,MySQLCluster,MyARCH,MyDB_ROLE,MyDB_STATUS
from django.contrib.auth.decorators import login_required
from CMDB.model.yewutree_model import YewuTreeMptt as YewuTree
from system.models import UserProfile

@login_required()
def mysql_cluster(request):
    return render(request, 'cmdb/db/mysql_cluster.html')

@login_required()
def mysql_cluster_add(request):
    mysql_arch=MyARCH
    operators= UserProfile.objects.all()
    my_status=MyDB_STATUS
    return render(request, 'cmdb/db/mysql_cluster_add.html',locals())


@login_required()
def mysql_cluster_edit(request,id):
    data = MySQLCluster.objects.get(id=id)
    mysql_arch = MyARCH
    operators = UserProfile.objects.all()
    prod_line = YewuTree.objects.filter(yewuxian__isnull=True)  # 业务的根结点为空，则就是产品线
    my_status = MyDB_STATUS
    return render(request, 'cmdb/db/mysql_cluster_edit.html',locals())

###########实例##########################

@login_required()
def mysql_cluster_instance(request):
    '''
    实例列表
    :param request:
    :return:
    '''
    return render(request, 'cmdb/db/mysql_instance.html')

@login_required()
def mysql_cluster_instance_show(request):
    return render(request, 'cmdb/db/mysql_instance.html')

@login_required()
def mysql_cluster_instance_add(request):
    myrole=MyDB_ROLE
    mycluster=MySQLCluster.objects.values('id','name')
    my_status = MyDB_STATUS

    return render(request, 'cmdb/db/mysql_instance_add.html',locals())

@login_required()
def mysql_cluster_instance_edit(request):

    id=request.GET['id']
    data=MySQL_Instance.objects.get(id=id)
    db_cluster=data.dbcluster.name
    return render(request, 'cmdb/db/mysql_instance_edit.html',locals())
####################################################################

@login_required()
def mysql_cluster_user(request):
    return render(request, 'cmdb/db/mysql_user.html')

@login_required()
def mysql_cluster_user_show(request):
    return render(request, 'cmdb/db/mysql_user.html')

@login_required()
def mysql_cluster_user_add(request):
    mycluster = MySQLCluster.objects.values('id', 'name')
    return render(request, 'cmdb/db/mysql_user_add.html',locals())

@login_required()
def mysql_cluster_user_edit(request):
    id=request.GET['id']
    data=Mysql_User.objects.get(id=id)
    db_cluster=data.dbcluster.name
    return render(request, 'cmdb/db/mysql_user_edit.html',locals())

##################集群内DB 操作#######################################
@login_required()
def mysql_cluster_db(request):
    return render(request, 'cmdb/db/mysql_db.html')

@login_required()
def mysql_cluster_db_show(request):
    return render(request, 'cmdb/db/mysql_db.html')

@login_required()
def mysql_cluster_db_add(request):
    mycluster = MySQLCluster.objects.values('id', 'name')
    return render(request, 'cmdb/db/mysql_db_add.html',locals())

@login_required()
def mysql_cluster_db_edit(request):
    id=request.GET['id']
    data=Mysql_db.objects.get(id=id)
    db_cluster=data.dbcluster.name
    return render(request, 'cmdb/db/mysql_db_edit.html',locals())
