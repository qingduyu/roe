#!/usr/bin/env python
# -*- coding:utf-8 -*-
#########################################################################
# File Name: nmap_all_server.py
# Program function:????????????????????
# Author:fanglianchao
# mail:flc009@163.com
# ========================================================================
import os

import paramiko
import traceback

from utils.encrpt import prpcrypt
import pexpect, datetime

dirs = os.path.realpath(os.path.dirname(__file__))
import  logging
def log(log_name, path=None):
    logging.basicConfig(level=logging.INFO,
                format='%(asctime)s %(levelname)s %(message)s',
                datefmt='%Y%m%d %H:%M:%S',
                filename=path+log_name,
                filemode='ab+')
    return logging.basicConfig

log("scanhost.log", dirs+'/')



class ssh_do(object):
    def __init__(self, info=""):
        self.whitelist = ["172.16.50.230",'172.16.50.222']
        self.result = {"info": info}

    def pass_do(self, login_info, cmd_list=""):
        '''
        密码方式登陆
        :param login_info:登陆信息比如，('172.16.50.230.', 22, 'root', '123')
        :param cmd_list:登陆后执行的命令
        :return:
        '''
        try:
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            ssh.connect(login_info[0], login_info[1], login_info[2], login_info[3], timeout=3)
            self.result["status"] = "success"
            for cmd in cmd_list:
                stdin, stdout, stderr = ssh.exec_command(cmd, timeout=10)
                std_res = stdout.read()
                self.result[cmd] = std_res
        except Exception as e:
            # print (traceback.print_exc(), login_info)
            # log.info("Use passwd ssh login exception:%s,%s" % (e, login_info))
            self.result["status"] = "failed"
            self.result["res"] = str(e)
        return self.result

    def rsa_do(self, login_info, cmd_list=""):
        '''
        id_rsa密药登陆
        :param login_info:('192.168.6.11', 22, 'root', '/key/id_rsa','123')
        :param cmd_list:
        :return:
        '''
        try:
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            key = paramiko.RSAKey.from_private_key_file(login_info[3])
            ssh.connect(login_info[0], login_info[1], login_info[2], pkey=key, timeout=2)
            self.result["status"] = "success"
            for cmd in cmd_list:
                stdin, stdout, stderr = ssh.exec_command(cmd, timeout=10)
                #           stdin.write("Y")   #??????? ?Y?
                std_res = stdout.read()
                self.result[cmd] = std_res
        except Exception as e:
            # print (traceback.print_exc())
            logging.info("Use rsa key ssh login exception:%s,%s" % (e, login_info))
            self.result["status"] = "failed"
            self.result["res"] = e
        return self.result

    def dsa_do(self, login_info, cmd_list=""):
        '''
        dsa方式登陆
        :param login_info:login_info:('192.168.6.11', 22, 'root', '/key/id_dsa','123')
        :param cmd_list:
        :return:
        '''
        try:
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            key = paramiko.DSSKey.from_private_key_file(login_info[3])
            ssh.connect(login_info[0], login_info[1], login_info[2], pkey=key, timeout=2)
            self.result["status"] = "success"
            for cmd in cmd_list:
                stdin, stdout, stderr = ssh.exec_command(cmd, timeout=10)
                std_res = stdout.read()
                self.result[cmd] = std_res
        except Exception as e:
            print (traceback.print_exc())
            logging.info("Use dsa key ssh login exception:%s,%s" % (e, login_info))
            self.result["status"] = "failed"
        return self.result

    def my_rsa_do(self, login_info, cmd_list=""):
        try:
            ssh = paramiko.SSHClient()
            ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
            key = paramiko.RSAKey.from_private_key_file(login_info[3], login_info[4])
            ssh.connect(login_info[0], int(login_info[1]), login_info[2], pkey=key, timeout=2)
            self.result["status"] = "success"
            for cmd in cmd_list:
                stdin, stdout, stderr = ssh.exec_command(cmd, timeout=10)
                std_res = stdout.read()
                self.result[cmd] = std_res
        except Exception as e:
            print (traceback.print_exc())
            logging.exception("Use rsa key and Non-root user ssh login exception:%s,%s" % (e, login_info))
            self.result["status"] = "failed"
        return self.result

    # def run(self, ip, cmd):
    #     if ip and cmd:
    #         print ("****************IP:s%"%ip)
    #
    #         ip_item = HostLoginifo.objects.get(ip=ip)  #这里要从数据库中去取数据，然后在发送。
    #         cn = prpcrypt()
    #         if ip_item.ssh_type == 0:
    #             ssh_passwd = cn.decrypt(ip_item.ssh_passwd)
    #             login_info = (ip_item.ip, int(ip_item.ssh_port), ip_item.ssh_user, ssh_passwd)
    #             res = self.pass_do(login_info, cmd)
    #         if ip_item.ssh_type == 1:
    #             login_info = (ip_item.ip, int(ip_item.ssh_port), ip_item.ssh_user, ip_item.ssh_rsa)
    #             res = self.rsa_do(login_info, cmd)
    #         if ip_item.ssh_type == 2:
    #             login_info = (ip_item.ip, int(ip_item.ssh_port), ip_item.ssh_user, ip_item.ssh_rsa)
    #             res = self.dsa_do(login_info, cmd)
    #         if ip_item.ssh_type == 3:
    #             login_info = (ip_item.ip, int(ip_item.ssh_port), ip_item.ssh_user, ip_item.ssh_rsa, ip_item.rsa_pass)
    #             res = self.my_rsa_do(login_info, cmd)
    #         return res
    #     else:
    #         return ""













