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
    if request.method=='GET':
        zhuku=MysqlFastSQL.objects.filter(exec_posi=u'主库')
        congku=MysqlFastSQL.objects.filter(exec_posi=u'从库')
        jiqun=MysqlFastSQL.objects.filter(exec_posi=u'集群')
        qita=MysqlFastSQL.objects.filter(exec_posi=u'其他')
        mysqlcluster = MySQLCluster.objects.all()
        return render(request, 'dbops/mysql/MysqlfastSQL_show.html',locals())

    if request.method=='POST':
        sqlid = request.POST['sqlid']
        sql=MysqlFastSQL.objects.get(id=sqlid).sql
        json_data = {'code': 200, 'msg': '选择数据库后，点击确定','sql':sql,'sqlid':sqlid}
        return JsonResponse(json_data, safe=False)


@login_required()
def MyfastSQL_result(request):
    if request.method=='GET':
        id = request.GET['id']
        Myfastsql = MysqlFastSQL.objects.get(id=id)
        sql = request.GET['sql']

        cluster = MySQLCluster.objects.get(id=request.GET['mysqlcluster_id'])
        if Myfastsql.exec_posi == u'从库':
            pass
        else:
            try:
                ip = cluster.foreign_ip
                port = cluster.foreign_port
                user = cluster.plat_user
                arch = cluster.arch
                passwd = cluster.plat_user_pass
                conn = MySQL(ip=ip, port=port, user=user, passwd=passwd)
                count, datalist, colName = conn.execute(sql=sql)
                return render(request, 'dbops/mysql/MysqlfastSQL_result.html', locals())
            except Exception as e:
                colName=[u'报错']
                datalist=[[u'请检查sql语句的错误，查不出来']]
                return render(request, 'dbops/mysql/MysqlfastSQL_result.html', locals())



