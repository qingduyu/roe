#!/usr/bin/env python
# -*- coding:utf-8 -*-

from binascii import b2a_hex, a2b_hex
import re
def mac_trans(mac):
    '''
    转化mac地址
    :param mac:
    :return:
    '''
    if mac:
        mac_lst = mac.split("\n")
        mac_res = [item.replace(":",'').replace("000000000000",'').replace("00000000",'') for item in mac_lst]
        mac_string = "_".join(mac_res)
        return mac_string
    else:
        return ""

def sn_trans(sn):
    '''
    转化序列号，去掉空格
    :param mac:
    :return:
    '''
    if sn:
        tmp=sn.split('\n')
        sn_res=''
        for i in tmp:
            if i:
                if i[0]=='#' or i[0]=='\n':
                    pass
                else:
                    sn_res = sn_res+i
        return sn_res
    else:
        return ""

def remove_space_line_symbol(strings):
    '''
    去掉空格和后面的回车符号
    :param string:
    :return:
    '''
    if strings:
        str_res= strings.replace(" ",'').replace("\n",'')
        return  str_res
    else:
        return ""


def machine_type_trans(mt):
    '''
    去掉回车 和注释 机器
    :param mac:
    :return:
    '''

    if mt:
        tmp=mt.split('\n')
        mt_res=''
        for i in tmp:
            if i:
                if i[0]=='#' or i[0]=='\n':
                    pass
                else:
                    mt_res = mt_res+i
        return mt_res
    else:
        return ""


def hostname_type_trans(mt):
    '''
    去掉回车 机器
    :param :
    :return:
    '''
    if mt:
        mt_res = mt.replace("\n",'')
        return mt_res
    else:
        return ""

def getsysversion(version_list):
    '''
    提取系统版本
    :param version_list:
    :return:
    '''
    for version_data in version_list:
        v_data_lst = re.findall("xen|vmware|centos|linux|ubuntu|redhat|\d{1,}\.\d{1,}",version_data,re.IGNORECASE)
        if v_data_lst:
            if len(v_data_lst) > 1:
                v_data = " ".join(v_data_lst)
                break
        else:
            v_data = ""
    return v_data