#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from utils.mysql import MySQL
from MysqlOps.models import MysqlFastSQL,SQL_EXEC
from CMDB.model.mysql_modles import MySQLCluster
from django.contrib.auth.decorators import login_required
from CMDB.model.yewutree_model import YewuTreeMptt as YewuTree
from system.models import UserProfile
from django.http import JsonResponse

@login_required()
def MyfastSQL_list(request):
    return render(request, 'dbops/mysql/MyfastSQL_list.html')

@login_required()
def MyfastSQL_add(request):
    sql_exec_typ=SQL_EXEC
    return render(request, 'dbops/mysql/MyfastSQL_add.html',locals())


@login_required()
def MyfastSQL_edit(request):
    id=request.GET['id']
    data = MysqlFastSQL.objects.get(id=id)
    sql_exec_typ=SQL_EXEC
    return render(request, 'dbops/mysql/MyfastSQL_edit.html',locals())


@login_required()
def MyfastSQL_show(request):
    zhuku=MysqlFastSQL.objects.filter(exec_posi=u'主库')
    congku=MysqlFastSQL.objects.filter(exec_posi=u'从库')
    jiqun=MysqlFastSQL.objects.filter(exec_posi=u'集群')
    qita=MysqlFastSQL.objects.filter(exec_posi=u'其他')
    return render(request, 'dbops/mysql/MysqlfastSQL_show.html',locals())

@login_required()
def MyfastSQL_result(request,id):
    if request.method=='GET':
        Myfastsql=MysqlFastSQL.objects.get(id=id)
        id=id
        mysqlcluster=MySQLCluster.objects.all()
        return render(request,'dbops/mysql/MysqlfastSQL_result.html',locals())

    if request.method=="POST":
        myfastsql = MysqlFastSQL.objects.get(id=id)
        sql=request.POST['sql']
        mysqlcluster = MySQLCluster.objects.get(id=request.POST['mysqlcluster_id'])

        if myfastsql.exec_posi==u'从库':
            pass
        else:
            ip = mysqlcluster.foreign_ip
            port = mysqlcluster.foreign_port
            user = mysqlcluster.plat_user
            arch = mysqlcluster.arch
            passwd = mysqlcluster.plat_user_pass
            conn=MySQL(ip=ip,port=port,user=user,passwd=passwd)
            count, result, colName=conn.execute(sql=sql)
            json_data = {'code': 200, 'msg': '获取结果', 'count':count,'result':result,'colName':'colName'}
            return JsonResponse(json_data, safe=False)
