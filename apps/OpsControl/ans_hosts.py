#!/usr/bin/env python
# _#_ coding:utf-8 _*_
from CMDB.models import Host
from OpsControl.models import Ansible_Inventory

from utils.logger import logger
from utils.encrpt import prpcrypt
def get_ans_host(hostid_list):
    '''
    传入的是 id 的列表， 输出的是 ip列表 和 可登陆主机的 【ip,port,username,password】
    :param hostid_list:
    :return:
    '''
    ip_list=[]
    host_list=[]
    try:
      host=  Host.objects.filter(id__in =hostid_list)

      if host:
          for i in host:
              temp = {}
              temp['ip']=i.ip
              temp['port']=int(i.port)
              temp['username']=i.username
              temp['sudo_passwd']=i.sudo_passwd
              if i.keyfile !=1:
                  pc = prpcrypt()
                  temp['password']=pc.decrypt(i.passwd)
              ip_list.append(i.ip)
              host_list.append(temp)

      return  ip_list,host_list
    except Exception as e:
        print e
        return ip_list,host_list


