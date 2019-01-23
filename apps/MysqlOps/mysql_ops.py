#!/bin/env python
#-*-coding:utf-8-*-
import MySQLdb,sys
# from mysqlask.include import function as func
from utils.mysql import MySQL
from celery import task
from CMDB.model.mysql_modles import MySQLCluster



#mysql
def mysql_query(sql,user,passwd,host,port,dbname):
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        cursor = conn.cursor()
        count=cursor.execute(sql)
        index=cursor.description
        col=[]

        try:
            for i in index:
                col.append(i[0])
        except Exception,e:
            conn.commit()
            cursor.close()
            conn.close()
            return (['ok'],''), ['set']

        result=cursor.fetchall()
        # result=cursor.fetchmany(size=int(limitnum))
        cursor.close()
        conn.close()
        return (result,col)
    except Exception,e:
        return([str(e)],''),['error']



def mysql_exec(sql,user,passwd,host,port,dbname):
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        curs = conn.cursor()
        result=curs.execute(sql)
        conn.commit()
        curs.close()
        conn.close()
        return ([u'影响行数'+str(result)],''),['success']
    except Exception,e:
        if str(e)=='(2014, "Commands out of sync; you can\'t run this command now")':
            return ([u'每次执行单条sql'],''),['error']
        else:
            return([str(e)],''),['error']



class MySQL_OPS(MySQL):
    def __init__(self, clusterobj,dbname=''):
        self.ip = clusterobj.foreign_ip
        self.user = clusterobj.plat_user
        self.passwd = clusterobj.plat_user_pass
        self.db = dbname
        self.port = int(clusterobj.foreign_port)
        self._sql=MySQL(self.ip,self.port,self.db,self.user,self.passwd)
        # self._conn = self.connect(self.ip, self.port, self.db, self.user, self.passwd)
        # self._cursor = self._conn.cursor()
    def getBinaryLog(self):
        result,col = self._sql.getBinaryLog()
        return  result,col

    def getTables(self):
        if self.db:
            sql='show tables;'
            rc,rs=self._sql.queryAll(sql=sql)
            return rc,rs
        else:
            rc=0
            rs=None
            return rc,rs




#COLUMN_KEY='PRI' AND

def run_process(insname,sql):
    flag = True

    for a in insname.db_name_set.all():
        for i in a.db_account_set.all():
            if i.role == 'admin':
                tar_username = i.user
                tar_passwd = pc.decrypt(i.passwd)
                flag = False
                break
        if flag == False:
            break
    # print tar_port+tar_passwd+tar_username+tar_host
    if vars().has_key('tar_username'):
        try:
            conn = MySQLdb.connect(host=insname.ip, user=tar_username, passwd=tar_passwd, port=int(insname.port),connect_timeout=5, charset='utf8')
            conn.select_db('information_schema')
            param=[]
            curs = conn.cursor()
            #result = curs.executemany(sql,param)
            for i in sql.split(';')[0:-1]:
                try:
                    curs.execute(i)
                except Exception,e:
                    pass
            conn.commit()
            curs.close()
            conn.close()
            return ([sql], ''), ['success']
        except Exception, e:
            # ?????????wrong_message
            results, col = ([str(e)], ''), ['error']
            # results,col = mysql_query(wrong_msg,user,passwd,host,int(port),dbname)
        return results, col
    else:
        return (['PLEASE set the admin role account FIRST'], ''), ['error']





def check_selfsql(selfsql):
    selfsql = selfsql.split(';')[0]
    if len(selfsql)==0:
        selfsql = "select 'please input'"
        return selfsql
    elif selfsql.split()[0].lower() not in ['set','show','select','create','purge','drop','purge','insert','update','delete','rename'] :
        selfsql = "select 'selfsql not allowed'"
    return  selfsql







