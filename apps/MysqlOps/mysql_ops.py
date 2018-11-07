#!/bin/env python
#-*-coding:utf-8-*-
import MySQLdb,sys
# from mysqlask.include import function as func
from utils.mysql import MySQL
from celery import task
from CMDB.model.mysql_modles import MySQLCluster

# public_user = func.public_user

#mysql
def mysql_query(sql,user,passwd,host,port,dbname):
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        cursor = conn.cursor()
        count=cursor.execute(sql)
        index=cursor.description
        col=[]
        #get column name
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
#??????????????? ???db id
def get_metadata(hosttag,flag,tbname=''):
    dbname = MySQLDB_name.objects.get(dbtag=hosttag).dbname
    #get table list
    if flag ==1:
        if len(tbname)>0:
            sql = "select TABLE_NAME,TABLE_TYPE,ENGINE,TABLE_COLLATION,TABLE_COMMENT from information_schema.tables where table_schema='"+dbname+"'" +" and TABLE_NAME like '%"+tbname+"%'"
        else :
            sql = "select TABLE_NAME,TABLE_TYPE,ENGINE,TABLE_COLLATION,TABLE_COMMENT from information_schema.tables where table_schema='"+dbname+"'"
        results, col, tar_dbname = get_data(hosttag,sql)
        return results,col,tar_dbname
    #get column list
    elif flag==2:
        sql = "SELECT ORDINAL_POSITION AS POS,COLUMN_NAME,COLUMN_TYPE,COLUMN_DEFAULT,IS_NULLABLE,CHARACTER_SET_NAME,COLLATION_NAME,COLUMN_KEY,EXTRA,COLUMN_COMMENT FROM information_schema.COLUMNS  where TABLE_SCHEMA='"+dbname+"'"+" and TABLE_NAME='"+tbname+"'"+' ORDER BY POS'
        results, col, tar_dbname = get_data(hosttag, sql)
        return results, col, tar_dbname
    #get indexes list
    elif flag==3:
        sql = "SELECT INDEX_NAME,NON_UNIQUE,SEQ_IN_INDEX,COLUMN_NAME,COLLATION,CARDINALITY,SUB_PART,PACKED,NULLABLE,INDEX_TYPE,COMMENT,INDEX_COMMENT FROM information_schema.statistics  where TABLE_SCHEMA='"+dbname+"'"+" and TABLE_NAME='"+tbname+"'"
        results, col, tar_dbname = get_data(hosttag, sql)
        return results, col, tar_dbname
    #table details
    elif flag == 4:
        sql = "select * from information_schema.tables where TABLE_SCHEMA='"+dbname+"'"+" and TABLE_NAME='"+tbname+"'"
        results, col, tar_dbname = get_data(hosttag, sql)
        return results, col, tar_dbname
    elif flag == 5:
        sql = "show create table " + tbname
        results, col, tar_dbname = get_data(hosttag, sql)
        return results, col, tar_dbname
    elif flag == 6:
        sql = "show tables ";
        results , col, tar_dbname = get_data(hosttag, sql)
        return results

def get_data(hosttag,sql):
    a = MySQLDB_name.objects.filter(dbtag=hosttag)[0]
    #a = Db_name.objects.get(dbtag=hosttag)
    tar_dbname = a.dbname
    #??instance????role='read'?????????
    try:
        if a.instance.all().filter(db_type__in=u'??')[0]:
            tar_host = a.instance.all().filter(db_type__in=u'??')[0].vist_ip
            tar_port = a.instance.all().filter(db_type__in=u'??')[0].port
    #?????????role=read??????????????
    except Exception,e:
        tar_host = a.instance.filter(db_type__in=[u'??',u'??'])[0].vist_ip
        tar_port = a.instance.filter(db_type__in=[u'??',u'??'])[0].port
    pc = prpcrypt()
    for i in a.mysqldb_user_set.all():
        if i.role == 'all':
            tar_username = i.dbuser
            rawpass = i.dbpasswd
            tar_passwd = pc.decrypt(rawpass)
            break
    #print tar_port+tar_passwd+tar_username+tar_host
    try:
        results,col = mysql_query(sql,tar_username,tar_passwd,tar_host,tar_port,tar_dbname)
    except Exception, e:
        #?????????wrong_message
        results,col = ([str(e)],''),['error']
        #results,col = mysql_query(wrong_msg,user,passwd,host,int(port),dbname)
    return results,col,tar_dbname

def process(insname,flag=1,sql=''):
    if flag ==1:
        sql = 'select * from information_schema.processlist ORDER BY TIME DESC'
        return get_process_data(insname,sql)
    elif flag ==2:
        sql = "select * from information_schema.processlist where COMMAND!='Sleep' ORDER BY TIME DESC"
        return get_process_data(insname, sql)
    elif flag == 3:
        sql = "show engine innodb status"
        return get_process_data(insname, sql)
    elif flag == 4:
        return run_process(insname, sql)
    elif flag == 5:
        sql = "show engine innodb mutex"
        return get_process_data(insname, sql)
    elif flag == 6:
        sql = "SELECT table_schema as 'DB',table_name as 'TABLE',CONCAT(ROUND(( data_length + index_length ) / ( 1024 * 1024 ), 2), '') 'TOTAL(M)' , table_comment as COMMENT FROM information_schema.TABLES ORDER BY data_length + index_length DESC limit 20;"
        return get_process_data(insname, sql)
    elif flag==7 :
        return get_process_data(insname, sql)
    elif flag == 8:
        sql ="SELECT\
        TABLE_SCHEMA,\
        TABLE_NAME,\
        COLUMNS.COLUMN_NAME,\
        COLUMNS.DATA_TYPE,\
        COLUMNS.COLUMN_TYPE,\
        IF(LOCATE('unsigned', COLUMN_TYPE) > 0,\
        1,\
        0\
        ) AS IS_UNSIGNED,\
        IF(LOCATE('int', DATA_TYPE) > 0,\
        1,\
        0\
        ) AS IS_INT,\
        (CASE DATA_TYPE\
        WHEN 'tinyint' THEN 255\
	    WHEN 'smallint' THEN 65535\
	    WHEN 'mediumint' THEN 16777215\
	    WHEN 'int' THEN 4294967295\
	    WHEN 'bigint' THEN 18446744073709551615\
	    END >> IF(LOCATE('unsigned', COLUMN_TYPE) > 0, 0, 1)\
	    ) AS MAX_VALUE,\
	    AUTO_INCREMENT,\
	    INDEX_NAME,\
	    SEQ_IN_INDEX\
	    FROM INFORMATION_SCHEMA.COLUMNS INNER JOIN INFORMATION_SCHEMA.TABLES USING (TABLE_SCHEMA, TABLE_NAME) INNER JOIN INFORMATION_SCHEMA.STATISTICS USING (TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME)\
		WHERE TABLE_SCHEMA not IN ('INFORMATION_SCHEMA','mysql','performance_schema') \
		AND SEQ_IN_INDEX=1 AND EXTRA='auto_increment' \
		GROUP BY TABLE_SCHEMA,TABLE_NAME,COLUMN_NAME order by AUTO_INCREMENT/MAX_VALUE desc limit 100;"
        return get_process_data(insname, sql)

#COLUMN_KEY='PRI' AND

def run_process(insname,sql):
    flag = True
    pc = prpcrypt()
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


#??????
def get_process_data(insname,sql):
    flag = True
    pc = prpcrypt()
    for a in insname.mysqldb_name_set.all():
        for i in a.mysqldb_user_set.all():
            if i.role == 'all':  #???admin
                tar_username = i.dbuser
                tar_passwd = pc.decrypt(i.dbpasswd)
                flag = False
                break
        if flag == False:
            break
    #print tar_port+tar_passwd+tar_username+tar_host
    if  vars().has_key('tar_username'):
        try:
            results,col = mysql_query(sql,tar_username,tar_passwd,insname.vist_ip,int(insname.port),'information_schema')
        except Exception, e:
            #?????????wrong_message
            results,col = ([str(e)],''),['error']
            #results,col = mysql_query(wrong_msg,user,passwd,host,int(port),dbname)
        return results,col
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



def get_his_meta(dbtag,flag):
    if flag ==1 :
        if dbtag=='all':
            sql = "select * from mon_tbsize order by `TOTAL(M)` desc limit 50"
        else:
            sql = "select * from mon_tbsize where DBTAG='" + dbtag + "' order by `TOTAL(M)` desc "
    elif flag ==2:
        if dbtag=='all':
            sql = "select * from mon_autoinc_status order by AUTO_INCREMENT/MAX_VALUE desc limit 20"
        else:
            sql = "select * from mon_autoinc_status where DBTAG='" + dbtag + "' order by AUTO_INCREMENT/MAX_VALUE desc limit 20"

    elif flag == 3:
        if dbtag == 'all':
            sql = "SELECT * FROM (select a.DBTAG,a.TABLE_SCHEMA,\
            a.TABLE_NAME, a.`TOTAL(M)` - b.`TOTAL(M)` AS 'inc_size(M)',\
             (UNIX_TIMESTAMP(a.update_time) - UNIX_TIMESTAMP(b.update_time))/3600 as 'DIF(h)',\
             a.update_time as 'LAST_CHECKTIME' from\
            mon_tbsize a join mon_tbsize_last b using (DBTAG,TABLE_NAME)) B order by 4 desc limit 20; "
        else:
            sql = "SELECT * FROM (select a.DBTAG,a.TABLE_SCHEMA,\
            a.TABLE_NAME, a.`TOTAL(M)` - b.`TOTAL(M)` AS 'inc_size(M)' ,\
            (UNIX_TIMESTAMP(a.update_time) - UNIX_TIMESTAMP(b.update_time))/3600 as 'DIF(h)',\
             a.update_time as 'LAST_CHECKTIME' from\
            mon_tbsize a join mon_tbsize_last b using (DBTAG,TABLE_NAME) where a.DBTAG='"+ dbtag +"') B  order by 4 desc limit 20; "
    elif flag == 4:
        #top 10 DBsize
        sql = "select DBTAG,sum(`TOTAL(M)`) as 'TOTAL(M)',sum(`DATA(M)`) as 'DATA(M)'\
        ,sum(`INDEX(M)`) as 'INDEX(M)' from mon_tbsize group by DBTAG order by 2 desc limit 10 ;"
    elif flag == 5:
        #top 10 DB increase
        sql ="select * from (select a.DBTAG,a.TOTAL AS 'TOTAL(Mb)',\
        a.DATA AS 'DATA(Mb)',a.INDEX AS 'INDEX(Mb)',a.TOTAL-b.TOTAL as 'TOTAL INC(Mb)',\
        ROUND((UNIX_TIMESTAMP(a.update_time) - UNIX_TIMESTAMP(b.update_time))/3600,2) as 'DIF(h)' \
        from (select DBTAG,sum(`TOTAL(M)`) as 'TOTAL',sum(`DATA(M)`) as 'DATA',sum(`INDEX(M)`) as \
        'INDEX',avg(update_time) as `update_time` from mon_tbsize_last group by DBTAG) b ,\
        (select DBTAG,sum(`TOTAL(M)`) as 'TOTAL',sum(`DATA(M)`) as 'DATA',sum(`INDEX(M)`) as \
        'INDEX' ,avg(update_time) as `update_time` from mon_tbsize group by DBTAG) a WHERE \
        a.DBTAG=b.DBTAG ) c order by 5 desc ,2 desc limit 10"

    elif flag ==6:
        sql = "select TABLE_NAME ,ROUND(AUTO_INCREMENT/MAX_VALUE*100,1),DBTAG as 'used_percent' from mon_autoinc_status order by AUTO_INCREMENT/MAX_VALUE desc limit 10"
    return mysql_query(sql, func.user, func.passwd, func.host, int(func.port), func.dbname)

def get_hist_dbinfo(dbtag,day):
    sql = "select a.time,round(avg(total),1) from (select date_format(update_time,'%Y-%m-%d') \
    time,`TOTAL(M)`  total from mon_dbsize_his where DBTAG='" + dbtag + "' and \
    update_time >DATE_SUB(CURDATE(),INTERVAL %d DAY)) \
    a group by a.time order by 1" %day
    return mysql_query(sql, func.user, func.passwd, func.host, int(func.port), func.dbname)


def get_hist_tbinfo(dbtag, tbname, day):
    sql = "select time,round(avg(total),1) from (select date_format(update_time, '%Y-%m-%d') time, round(`TOTAL(M)`, 1) total \
    from mon_tbsize_his where \
    DBTAG = '" + dbtag + "' and TABLE_NAME = '" + tbname +"' and update_time > DATE_SUB(CURDATE(), INTERVAL %d DAY) ) b  group by b.time order by 1" % day
    return mysql_query(sql, func.user, func.passwd, func.host, int(func.port), func.dbname)


