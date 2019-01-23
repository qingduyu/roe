#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from utils.mysql import MySQL
from MysqlOps.models import MysqlFastSQL,SQL_EXEC
from CMDB.model.mysql_modles import MySQLCluster,Mysql_db
from django.contrib.auth.decorators import login_required
from CMDB.model.yewutree_model import YewuTreeMptt as YewuTree
from system.models import UserProfile

from django.http import JsonResponse
from MysqlOps.models import mysql_sql_log
from MysqlOps.mysql_ops import mysql_exec,mysql_query
import  datetime

from utils import sqlfilter


def mysql_sql_cmd(request):
    if request.method=='GET':
        return render(request,'dbops/mysql/mysql_sql_cmd.html',locals())
    if request.method=='POST':

        clusterid=request.POST['clusterid']
        if not clusterid:
            json_data={'code':500,'msg':'请选择数据库'}
            return JsonResponse(json_data)
        cluster=MySQLCluster.objects.get(id=clusterid)
        dbid=request.POST['dbid']
        sql_contents = request.POST['sql_content']
        # sql_list = sqlparse.split(sql_contents)
        sql_list= sqlfilter.get_sql_detail(sqlfilter.sql_init_filter(sql_contents), 2)
        # create_time = datetime.datetime.now()+datetime.timedelta(hours=8)
        lastlogin = request.user.last_login
        create_time = datetime.datetime.now()
        username = request.user.username

        ipaddr = get_client_ip(request)

        if dbid:
            mysqldb = Mysql_db.objects.get(id=dbid)
            for sql_i in sql_list:
                    try:
                        sqltype = sql_i.split()[0].lower()
                        dolog = mysql_sql_log(user=username, sqltext=sql_i, sqltype=sqltype, login_time=lastlogin,
                                            create_time=create_time,affect_row='',exe_status='', dbname=mysqldb.dbname, dbcluster=cluster.name,
                                            ipaddr=ipaddr)
                        results, col = mysql_exec(sql_i, cluster.plat_user, cluster.plat_user_pass, cluster.foreign_ip,
                                                  cluster.foreign_port, mysqldb.dbname)
                        dolog.affect_row=results[0][0]
                        dolog.exe_status=col[0]
                        dolog.save()
                    except Exception as e:
                        json_data={'code':900,'msg':'中间报错，已经终止执行了请看已经执行的sql'}
                        return JsonResponse(json_data)

            json_data = {'code': 200, 'msg': '已经全部执行完毕，请看已经执行的sql'}
            return JsonResponse(json_data)
                # else:
                #     results, col = mysql_query(sql_i, cluster.plat_user, cluster.plat_user_pass, cluster.foreign_ip,
                #                                cluster.foreign_port, mysqldb.dbname)
        else:
            for sql_i in sql_list:
                sqltype = sql_i.split()[0].lower()
                dolog = mysql_sql_log(user=username, sqltext=sql_i, sqltype=sqltype, login_time=lastlogin,
                                      create_time=create_time, dbname='', dbcluster=cluster.name,
                                      ipaddr=ipaddr)
                results, col = mysql_exec(sql_i, cluster.plat_user, cluster.plat_user_pass, cluster.foreign_ip,
                                          cluster.foreign_port, '')
                dolog.affect_row = results[0]
                dolog.exe_status = col[0]
                dolog.save()



def get_mysql_cluster(request):
    mysql_cluster=MySQLCluster.objects.all()
    data=[]
    for i in mysql_cluster:
        temp = dict()
        temp['value']=i.id
        temp['key']=i.foreign_ip +'('+ str(i.foreign_port)+')' + '('+i.name+')'
        data.append(temp)
    json_data=data

    return JsonResponse(json_data,safe=False)

def get_mysql_db(request):
    if request.method=='POST':
        clusterid=request.POST['id']
        databases=Mysql_db.objects.filter(dbcluster_id=clusterid)
        data = []
        for i in databases:
            temp = dict()
            temp['value'] = i.id
            temp['key'] = i.dbname
            data.append(temp)
        json_data = data
        return JsonResponse(json_data, safe=False)




def log_mysql_op(user,sqltext,mydbname,dbclustername,request):

    #lastlogin = user.last_login+datetime.timedelta(hours=8)
    #create_time = datetime.datetime.now()+datetime.timedelta(hours=8)
    lastlogin = user.last_login
    create_time = datetime.datetime.now()
    username = user.username
    sqltype=sqltext.split()[0].lower()
    if sqltype in ['desc','describe']:
        sqltype='show'
    #??ip??
    ipaddr = get_client_ip(request)
    log = mysql_sql_log (user=username,sqltext=sqltext,sqltype=sqltype,login_time=lastlogin,create_time=create_time,dbname=mydbname,dbcluster=dbclustername,ipaddr=ipaddr)
    log.save()
    return 1

def get_client_ip(request):
    try:
        real_ip = request.META['HTTP_X_FORWARDED_FOR']
        regip = real_ip.split(",")[0]
    except:
        try:
            regip = request.META['REMOTE_ADDR']
        except:
            regip = ""
    return regip