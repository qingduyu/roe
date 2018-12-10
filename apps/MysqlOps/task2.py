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
def parse_binlog(instance,binname,dbname,tablesname,start_time,stop_time,sql_type,flash_back=False,mail_to_list=None):
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
             BinlogParseRedo.objects.raw('delete from binlogParseRedo;')
             for i in sqllist:
                 tmplist=i.split('#')
                 sql=tmplist[0]
                 poslist=tmplist[1].split(' ')
                 BinlogParseRedo.objects.create(sql=sql,start_pos=poslist[1],end_pos=poslist[3],date=poslist[5],time=poslist[6])
    except Exception as ex:
        print  ex
        date=time.strftime("%Y-%m-%d")
        timenow=time.strftime('%H:%M:%S')
        BinlogParseRedo.objects.create(sql=ex,date=date,time=timenow)
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


