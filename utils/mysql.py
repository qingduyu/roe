#!/usr/bin/env python  
# _#_ coding:utf-8 _*_ 
import commands,os,sys
import MySQLdb
from utils.logger import logger

def loads(host,user,passwd,port,dbname,sql):
    cmd = "mysql -h {host} -u {user} -p{passwd}  {dbname} -P {port} --default-character-set=utf8 < {sql}".format(host=host,user=user,passwd=passwd,dbname=dbname,sql=sql,port=port)
    return commands.getstatusoutput(cmd)    

def dumps(host,user,passwd,port,dbname,sql,tables=None):
    if tables:cmd = "mysqldump -h {host} -u {user} -p{passwd} -P {port} {dbname}  {tables }> {sql}".format(host=host,user=user,passwd=passwd,port=port,dbname=dbname,sql=sql,tables=tables)
    else:cmd = "mysqldump -h {host} -u {user} -p{passwd} -P {port} {dbname} > {sql}".format(host=host,user=user,passwd=passwd,port=port,dbname=dbname,sql=sql)
    return commands.getstatusoutput(cmd)


class MySQL(object):

    def __init__(self, ip, port, dbname='', user=None, passwd=None):
        self.ip = ip
        self.user = user
        self.passwd = passwd
        self.db = dbname
        self.port = int(port)
        self.con = object
        self._conn = self.connect(self.ip, self.port, self.db, self.user, self.passwd)
        self._cursor = self._conn.cursor()

    def connect(self, host, port, dbname, user, passwd):
        try:
            conn = MySQLdb.connect(host, user, passwd, dbname, port,connect_timeout=2)
            return conn
        except MySQLdb.Error, ex:
            print ex
            return False

    def execute(self, sql, num=1000):
        try:
            count = self._cursor.execute(sql)
            index = self._cursor.description
            colName = []
            if index:
                for i in index:
                    colName.append(i[0])
            result = self._cursor.fetchmany(size=num)
            self._conn.commit()
            return count,result,colName
        except Exception, ex:
            logger.error(msg="MySQL执行SQL语句失败: {ex} sql:{sql}".format(ex=ex, sql=sql))
            self.conn.rollback()
            count = 0
            result = None
            colName=None
        finally:
            return count,result,colName

    def queryAll(self, sql):
        try:
            count = self._cursor.execute(sql)
            result = self._cursor.fetchall()
            return count, result
        except Exception, ex:
            logger.error(msg="MySQL查询失败: {ex} sql:{sql}".format(ex=ex, sql=sql))
            count = 0
            result = None
        finally:
            return count, result

    def queryOne(self, sql):
        try:
            count = self._cursor.execute(sql)
            result = self._cursor.fetchone()
            return count, result
        except Exception, ex:
            logger.error(msg="MySQL查询失败: {ex} sql:{sql}".format(ex=ex, sql=sql))
            result = None
        finally:
            return result

    def getVariables(self):
        rc, rs = self.queryAll(sql='show global variables;')
        dataList = []
        if rc != 0 and rs != None:
            for rcd in rs:
                dataList.append(rcd)
        data_dict = {}
        for item in dataList:
            data_dict[item[0]] = item[1]
        return data_dict

    def getStatus(self):
        rc, rs = self.queryAll(sql='show global status;')
        dataList = []
        if rc != 0 and rs != None:
            for rcd in rs:
                dataList.append(rcd)
        data_dict = {}
        for item in dataList:
            data_dict[item[0]] = item[1]
        return data_dict

    def getWaitThreads(self):
        rs = self.queryOne(
            sql="select count(1) as count from information_schema.processlist where state <> '' and user <> 'repl' and time > 2;")
        if rs != None:
            return rs
        else:
            return {}

    def getMasterSatus(self):
        rs = self.queryOne(sql="show master status;")
        if rs != None:
            return rs
        else:
            return {}

    def getSlaveIP(self):
        rs = self.queryOne(sql="select user,host from performance_schema.accounts where user ='slave' or user like 'repli%';")
        if rs != None:
            return rs
        else:
            return {}

    def getReplStatus(self):
        rs = self.queryOne(sql='show slave status;')
        if rs != None:
            return rs
        else:
            return {}

    def getInnoClusterInstance(self):
        count,result,columns=self.execute(sql='SELECT a.member_host,a.MEMBER_PORT,b.instance_name,a.MEMBER_ROLE,a.MEMBER_STATE '
                                              'FROM performance_schema.replication_group_members a left JOIN mysql_innodb_cluster_metadata.instances b '
                                              'on a.MEMBER_ID=b.mysql_server_uuid  order by MEMBER_ROLE;')

        return count,result,columns

    def getBinaryLog(self):
        try:

            rc,rs,col = self.execute(sql='show binary logs;')
        except Exception, ex:
            print (ex)
        if rs != None:
            return rs,col
        else:
            rs=[]
            return rs,col
    def close(self):
        try:
            self._cursor.close()
            self._conn.close()
        except Exception, ex:
            print ex