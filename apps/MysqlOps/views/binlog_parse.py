#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from CMDB.model.mysql_modles import MySQL_Instance,Mysql_db,Mysql_User,MySQLCluster,MyARCH,MyDB_ROLE,MyDB_STATUS
from django.contrib.auth.decorators import login_required

from MysqlOps.mysql_ops import MySQL_OPS
from MysqlOps import  tasks

@login_required()
def binlog_parse(request):
    cluster = MySQLCluster.objects.all().order_by('tree_id')

    if request.method == 'POST':
        if request.POST.has_key('show_binary'):

            try:
                binlist = []
                instance = MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
                datalist, col = MySQL_OPS(instance).getBinaryLog()
                dblist=instance.mysql_db.values('dbname')
                if col:
                    for i in datalist:
                        binlist.append(i[0])
                else:
                    del binlist
                    return render(request, 'dbops/mysql/binglog.html', locals())

                return render(request, 'dbops/mysql/binglog.html', locals())
            except Exception, e:
                pass
        elif request.POST.has_key('get_binlog_startime'):
            binname = request.POST['binary_list']
            dbname=request.POST['dbname' ] #前殿选定的数据库名字
            instance = MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
            dblist = instance.mysql_db.values('dbname') #提取的DB列表,方便前端作二次选择
            db_selected=dbname
            tablelist=[]
            rc,rs=MySQL_OPS(instance,dbname=dbname).getTables()
            if rc:
                for i in rs:
                    tablelist.append(i[0])


            connect_info={
                'host':instance.foreign_ip,
                'port':instance.foreign_port,
                'user':instance.plat_user,
                'passwd':instance.plat_user_pass

            }
            event_startime = tasks.get_binlog_starttime(connect_info, binname)
            binlist = []
            datalist, col = MySQL_OPS(instance).getBinaryLog()
            if col:
                for i in datalist:
                    binlist.append(i[0])
            return  render(request,'dbops/mysql/binglog.html',locals())


        elif request.POST.has_key('parse'):
                parse=request.POST['parse']
                binname = request.POST['binary_list']
                sql_type=request.POST['sql_type']


                # print countnum
                start_time = request.POST['start_time']
                stop_time = request.POST['stop_time']
                tb_selected =request.POST['tablename']
                # binlist=request.POST['binlist']
                event_startime=request.POST['start_time']
                dbname = request.POST['dbname']

                db_selected = dbname
                instance=  MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
                dblist = instance.mysql_db.values('dbname')  # 提取的DB列表,方便前端作二次选择
                # tasks.parse_binlog.delay(instance, binname,dbname, tablename,start_time,stop_time ,countnum=countnum,flash_back=False)
                tables=[]
                tables.append(tb_selected)

                sqltypes=[]
                sqltypes.append(sql_type)

                tasks.parse_binlog.delay(instance, binname, dbname=dbname, tablesname=tables, start_time=start_time, stop_time=stop_time, sql_type=sqltypes, flash_back=False)
                info = "日志解析任务已经提交 等待返回结果"
                binlist = []
                datalist, col = MySQL_OPS(instance).getBinaryLog()
                if col:
                    for i in datalist:
                        binlist.append(i[0])

                tablelist = []
                rc, rs = MySQL_OPS(instance, dbname=dbname).getTables()
                if rc:
                    for i in rs:
                        tablelist.append(i[0])
                show_btn_parse_record = 1
                return render(request,'dbops/mysql/binglog.html',locals())
        elif request.POST.has_key('parse_record'):  #查看解析记录
            parse_record = request.POST['parse_record']
            # parse=request.POST['parse']
            binname = request.POST['binary_list']
            sql_type = request.POST['sql_type']
            # print countnum
            start_time = request.POST['start_time']
            stop_time = request.POST['stop_time']
            tb_selected = request.POST['tablename']

            event_startime = request.POST['start_time']
            dbname = request.POST['dbname']

            db_selected = dbname
            instance = MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
            dblist = instance.mysql_db.values('dbname')  # 提取的DB列表,方便前端作二次选择

            sqltypes = []
            sqltypes.append(sql_type)

            binlist = []
            datalist, col = MySQL_OPS(instance).getBinaryLog()
            if col:
                for i in datalist:
                    binlist.append(i[0])
            tablelist = []
            rc, rs = MySQL_OPS(instance, dbname=dbname).getTables()
            if rc:
                for i in rs:
                    tablelist.append(i[0])
            show_tb_parse_record=1
            show_btn_parse_record = 1
            return render(request,'dbops/mysql/binglog.html',locals())
        elif request.POST.has_key('parse_undo'):  #开始逆向解析
                parse_undo=request.POST['parse_undo']
                binname = request.POST['binary_list']
                sql_type=request.POST['sql_type']
                # print countnum
                start_time = request.POST['start_time']
                stop_time = request.POST['stop_time']
                tb_selected =request.POST['tablename']
                # binlist=request.POST['binlist']
                event_startime=request.POST['start_time']
                dbname = request.POST['dbname']

                db_selected = dbname
                instance=  MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
                dblist = instance.mysql_db.values('dbname')  # 提取的DB列表,方便前端作二次选择
                # tasks.parse_binlog.delay(instance, binname,dbname, tablename,start_time,stop_time ,countnum=countnum,flash_back=False)
                tables=[]
                tables.append(tb_selected)

                sqltypes=[]
                sqltypes.append(sql_type)

                tasks.parse_binlog.delay(instance, binname, dbname=dbname, tablesname=tables, start_time=start_time, stop_time=stop_time, sql_type=sqltypes, flash_back=True)
                info = "日志逆向解析任务已经提交 请等一会儿"
                binlist = []
                datalist, col = MySQL_OPS(instance).getBinaryLog()
                if col:
                    for i in datalist:
                        binlist.append(i[0])

                tablelist = []
                rc, rs = MySQL_OPS(instance, dbname=dbname).getTables()
                if rc:
                    for i in rs:
                        tablelist.append(i[0])
                show_btn_parse_undo_record = 1
                return render(request,'dbops/mysql/binglog.html',locals())
        elif request.POST.has_key('parse_undo_record'):  # 查看n逆向解析记录
            parse_record = request.POST['parse_undo_record']
            # parse=request.POST['parse']
            binname = request.POST['binary_list']
            sql_type = request.POST['sql_type']
            # print countnum
            start_time = request.POST['start_time']
            stop_time = request.POST['stop_time']
            tb_selected = request.POST['tablename']

            event_startime = request.POST['start_time']
            dbname = request.POST['dbname']

            db_selected = dbname
            instance = MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
            dblist = instance.mysql_db.values('dbname')  # 提取的DB列表,方便前端作二次选择

            sqltypes = []
            sqltypes.append(sql_type)

            binlist = []
            datalist, col = MySQL_OPS(instance).getBinaryLog()
            if col:
                for i in datalist:
                    binlist.append(i[0])
            tablelist = []
            rc, rs = MySQL_OPS(instance, dbname=dbname).getTables()
            if rc:
                for i in rs:
                    tablelist.append(i[0])
            show_tb_parse_undo_record = 1
            show_btn_parse_undo_record = 1
            return render(request, 'dbops/mysql/binglog.html', locals())

        elif request.POST.has_key('sendmail'):
            parse = request.POST['parse']
            binname = request.POST['binary_list']
            sql_type = request.POST['sql_type']

            # print countnum
            start_time = request.POST['start_time']
            stop_time = request.POST['stop_time']
            tb_selected = request.POST['tablename']
            # binlist=request.POST['binlist']
            event_startime = request.POST['start_time']
            dbname = request.POST['dbname']

            db_selected = dbname
            instance = MySQLCluster.objects.get(id=int(request.POST['cluster_id']))
            dblist = instance.mysql_db.values('dbname')  # 提取的DB列表,方便前端作二次选择
            # tasks.parse_binlog.delay(instance, binname,dbname, tablename,start_time,stop_time ,countnum=countnum,flash_back=False)
            tables = []
            tables.append(tb_selected)

            sqltypes = []
            sqltypes.append(sql_type)

            tasks.sendmail.delay(instance, binname, dbname=dbname, tablesname=tables, start_time=start_time,
                                     stop_time=stop_time, sql_type=sqltypes, flash_back=False)
            info = "邮件已经发送请注意查收"
            binlist = []
            datalist, col = MySQL_OPS(instance).getBinaryLog()
            if col:
                for i in datalist:
                    binlist.append(i[0])

            tablelist = []
            rc, rs = MySQL_OPS(instance, dbname=dbname).getTables()
            if rc:
                for i in rs:
                    tablelist.append(i[0])

            return render(request, 'dbops/mysql/binglog.html', locals())

        return render(request, 'dbops/mysql/binglog.html', locals())

    else:
        return render(request, 'dbops/mysql/binglog.html', locals())