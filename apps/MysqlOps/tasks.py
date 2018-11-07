#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from celery import task
import datetime,time
from django.contrib.auth.models import User

from django.core.mail import EmailMessage,send_mail,EmailMultiAlternatives
from django.template import loader
from MysqlOps.models import BinlogParseRedo
from utils import  binlog2sql
# from dbops.settings import
EMAIL_SENDER='fanglianchao@veredholdings.com'

@task
# def process_runtask(hosttag,sqltext,mytask):
#     flag = (1 if mytask.backup_status == 1 else 3)
#     results,col,tar_dbname = incept.inception_check(hosttag,sqltext,flag)
#     incept.make_sure_mysql_usable()
#     status='executed'
#     c_time = mytask.create_time
#     mytask.update_time = datetime.datetime.now()
#     if flag == 1:
#         mytask.backup_status=2
#     mytask.save()
#     for row in results:
#         try:
#             inclog = Incep_error_log(myid=row[0],stage=row[1],errlevel=row[2],stagestatus=row[3],errormessage=row[4],\
#                          sqltext=row[5],affectrow=row[6],sequence=row[7],backup_db=row[8],execute_time=row[9],sqlsha=row[10],\
#                          create_time=c_time,finish_time=mytask.update_time)
#             inclog.save()
#             #if some error occured in inception_check stage
#         except Exception,e:
#             inclog = Incep_error_log(myid=999,stage='',errlevel=999,stagestatus='',errormessage=row[0],\
#                          sqltext=e,affectrow=999,sequence='',backup_db='',execute_time='',sqlsha='',\
#                          create_time=c_time,finish_time=mytask.update_time)
#             inclog.save()
#         if (int(row[2])!=0):
#             status='executed failed'
#             #record error message of incept exec
#     mytask.status = status
#     mytask.save()
#     sendmail_task.delay(mytask)

@task
def parse_binlog(instance,binname,dbname,tablesname,start_time,stop_time,sql_type,flash_back=False):
    connect_info = {
        'host': instance.foreign_ip,
        'port': instance.foreign_port,
        'user': instance.plat_user,
        'passwd': instance.plat_user_pass

    }
    try:
         binlogsql = binlog2sql.Binlog2sql(connection_settings=connect_info, start_file=binname,
                                      start_pos=4, end_file='', end_pos=0,
                                      start_time=start_time, stop_time=stop_time, only_schemas=dbname,
                                      only_tables=tablesname, no_pk=False, flashback=flash_back,sql_type=sql_type, stop_never=False)
         sqllist= binlogsql.process_binlog()
         if sqllist:
             # BinlogParseRedo.objects.extra(where=['id >0']).delete()
             BinlogParseRedo.objects.filter(start_pos__gt=0).delete()        #每次改变任务内容都要重新启动 celery
             # BinlogParseRedo.objects.raw('truncate table binlogParseRedo')

             binlog_list_to_insert=[]
             for i in sqllist:
                 tmplist=i.split('#')
                 sql=tmplist[0]
                 poslist=tmplist[1].split(' ')
                 # dt=poslist[5]+ ' '+poslist[6]
                 # date_time=datetime.datetime.strptime(dt,'%Y-%m-%d %H:%M:%S')
                 binlog_list_to_insert.append(BinlogParseRedo(sql=sql,start_pos=poslist[1],end_pos=poslist[3],date=poslist[5],time=poslist[6]))
             BinlogParseRedo.objects.bulk_create(binlog_list_to_insert)
    except Exception as ex:
        print  ex
        date=time.strftime("%Y-%m-%d")
        timenow=time.strftime('%H:%M:%S')
        BinlogParseRedo.objects.create(sql=ex,start_pos=1,date=date,time=timenow)
    # sqllist = binlogsql.sqllist
    # sendmail_sqlparse.delay(username, dbselected, tbname, sqllist,flash_back)


def get_binlog_starttime(connect_info,binname):
    try:
        connection_settings = connect_info
        binlogsql = binlog2sql.Binlog2sql(connection_settings=connection_settings, start_file=binname,no_pk=False)
        event_startime=binlogsql.get_binlog_startime()
        return event_startime
    except Exception as e:
        print  e



# def parse_binlogfirst(connect_info,binname,countnum):
#     try:
#         connection_settings = connect_info
#         binlogsql = binlog2sql.Binlog2sql(connection_settings=connection_settings, start_file=binname,no_pk=False,  countnum=countnum)
#         binlogsql.process_binlog()
#         sqllist = binlogsql.sqllist
#     except Exception as e:
#         sqllist=e
#         print  e
#     return sqllist




@task
def sendmail_sqlparse(mailto,db,tb,sqllist,flashback):
    '''

    :param mailto:收件人列表 "
    :param db:
    :param tb:
    :param sqllist:
    :param flashback:
    :return:
    '''
    if flashback==True:
        title = u"日志逆向解析结果 "+ db + "." + tb
    else:
        title = u"日志解析结果" + db + "." + tb

    html_content = loader.render_to_string('mail_template.html', locals())
    sendmail(title, mailto, html_content)




def sendmail (title,mailto,html_content):
    try:
        msg = EmailMultiAlternatives(title, html_content, EMAIL_SENDER, mailto)
        msg.attach_alternative(html_content, "text/html")
        msg.send()
    except Exception,e:
        print e


# @task
# def sendmail_task(task):
#     # tmp=u'x'
#     try:
#         mailto = []
#         for i in UserInfo.objects.filter(email__gt=0):
#             if len(i.user.email) > 0:
#                 mailto.append(i.user.email)
#         # if type(task) != type(tmp):
#         if task.status != 'NULL':
#             # del tmp
#             mailto.append(User.objects.get(username=task.user).email)
#             result_status = Incep_error_log.objects.filter(create_time=task.create_time).filter(finish_time=task.update_time).order_by("-myid")
#             title = 'Task ID:' + str(task.id) + '  has finished'
#         else:
#             title = "You have received new task!"
#             tmp = task
#         html_content = loader.render_to_string('include/mail_template.html', locals())
#         sendmail(title, mailto, html_content)
#
#     except Exception ,e:
#         print e
#
# @task
# def sendmail_forget(sendto,title,message):
#     mailto=[]
#     message=message
#     mailto.append(sendto)
#     html_content = loader.render_to_string('include/mail_template.html', locals())
#     sendmail(title, mailto, html_content)

#
#
#

#
# def task_run(idnum,request):
#     while 1:
#         try:
#             task = Task.objects.get(id=idnum)
#         except:
#             continue
#         break
#     if task.status!='executed' and task.status!='running' and task.status!='NULL':
#         hosttag = task.dbtag
#         sql = task.sqltext
#         mycreatetime = task.create_time
#         incept.log_incep_op(sql,hosttag,request,mycreatetime)
#         status='running'
#         task.status = status
#         task.operator  = request.user.username
#         task.update_time = datetime.datetime.now()
#         task.save()
#         process_runtask.delay(hosttag,sql,task)
#         return ''
#     elif task.status=='NULL':
#         return 'PLEASE CHECK THE SQL FIRST'
#     else:
#         return 'Already executed or in running'
