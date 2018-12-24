# !/usr/bin/env python
# _#_ coding:utf-8 _*_



from CMDB.model.mysql_modles import Mysql_db,Mysql_User,MySQL_Instance,MySQLCluster
from CMDB.serializers import *


from utils.mysql import MySQL

class MySQL_update(object):
    def __init__(self,clusterid):
        self._cluster=MySQLCluster.objects.get(id=clusterid)
        self.cluster_id=clusterid
        self.ip=self._cluster.foreign_ip
        self.port=self._cluster.foreign_port
        self.user=self._cluster.plat_user
        self.arch=self._cluster.arch
        self.passwd=self._cluster.plat_user_pass
        self._conn=MySQL(ip=self.ip,port=self.port,user=self.user,passwd=self.passwd)

    def mysql_update_db(self):
#取出数据库信息
        sql='''
        select
        table_schema as 'databases',
        sum(table_rows) as 'allrows',
        sum(truncate(data_length / 1024 / 1024, 2)) as 'dbsize(MB)',
        sum(truncate(index_length / 1024 / 1024, 2)) as 'indsize(MB)'
        from information_schema.tables where TABLE_SCHEMA not in (
        'mysql','sys','information_schema','performance_schema')
        group  by table_schema  order
        by  sum(data_length)  desc, sum(index_length) desc;
        '''
        rc, rs = self._conn.queryAll(sql=sql)
        mysqldb=self._cluster.mysql_db

        for ii in rs:  #获取用户，更新用户
           aa=mysqldb.get_or_create(dbname=ii[0],dbcluster_id=self.cluster_id)
           # aa[0].objects.update(db_rows=ii[1],db_size=ii[2],index_size=ii[3])
           aa[0].db_rows=ii[1]
           aa[0].db_size=ii[2]
           aa[0].index_size=ii[3]
           aa[0].save()

        return True



    def mysql_update_user(self):
        #取出用户信息,这里过滤DBA使用的用户
        sql='''
        select 
        user,
        host from mysql.user where user not in('root','dba','backup','monitor','slave') and user not like 'mysql%' and user not like 'repli%';
        '''
        rc, rs = self._conn.queryAll(sql=sql)
        mysql_user=self._cluster.mysql_user
        for ii in rs:
            sql2="show grants for %s@`%s`;" %(ii[0],ii[1])
            rc2 ,rs2=self._conn.queryAll(sql=sql2)
            priv=''
            for jj in rs2:
               priv=priv+jj[0]+' ;  '
            aa=mysql_user.get_or_create(db_user=ii[0],db_host=ii[1],dbcluster_id=self.cluster_id)
            aa[0].privlige=priv
            aa[0].save()

        return True

#
    def mysql_update_instance(self):

        if self.arch=='主从':
            rs = self._conn.getSlaveIP()
            conn_slave=MySQL(ip=rs[1],port=self.port,user=self.user,passwd=self.passwd)
            slavestatus = conn_slave.getReplStatus()  #嗲用的是show slave status
            myinstance=self._cluster.mysql_instance
            if slavestatus[3]==self.port: #代表主从是一致的
                slave= myinstance.get_or_create(dbcluster_id=self.cluster_id,m_ip=rs[1],port=self.port)
                slave[0].master_ip=slavestatus[1]
                slave[0].master_port=slavestatus[3]
                slave[0].role=u'从库'
                # slave[0].db_status=u'仅从库'
                slave[0].save()
                master=myinstance.get_or_create(dbcluster_id=self.cluster_id,m_ip=rs2[1],port=self.port)
                master[0].vist_ip=self.ip
                master[0].role=u'主库'
                master[0].db_status=u'服务中'
                master[0].save()
            else:
                print(u'主从添加实例不对阿')
        elif self.arch==u'单库':
            myinstance=self._cluster.mysql_instance
            single=myinstance.get_or_create(dbcluster_id=self.cluster_id,m_ip=self.ip,port=self.port)
            single[0].vist_ip=self.ip
            single[0].role=u'单库'
            single[0].db_status=u'服务中'
            single[0].save()
        elif self.arch==u'innodb_cluster':
            count,result,columns=self._conn.getInnoClusterInstance()
            myinstance=self._cluster.mysql_instance
            masterip=''
            master_port=''
            for i in range(count):
                ip=result[i][2].split(':')[0]

                port=result[i][1]
                role_0=result[i][3]
                db_status=result[i][4]

                clusertI=myinstance.get_or_create(dbcluster_id=self.cluster_id,m_ip=ip,port=port)
                clusertI[0].vist_ip=ip
                if role_0==u'PRIMARY':
                    clusertI[0].role=u'主库'
                    masterip=ip
                    master_port=port
                else:
                    clusertI[0].role = u'从库'
                    clusertI[0].master_ip=masterip
                    clusertI[0].master_port=master_port
                if db_status==u'ONLINE':
                    clusertI[0].db_status=u'服务中'
                else:
                    clusertI[0].db_status = u'故障'

                clusertI[0].save()

        return True
