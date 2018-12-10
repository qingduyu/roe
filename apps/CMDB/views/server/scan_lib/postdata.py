#!/usr/bin/env python
# -*- coding:utf-8 -*-
#########################################################################
# Author:qingduyu
# Email:flc009@163.com

import requests
import  logging
import  os
dirs = os.path.realpath(os.path.dirname(__file__))
# import sys

def log(log_name, path=None):
    logging.basicConfig(level=logging.INFO,format='%(asctime)s %(levelname)s %(message)s',
                datefmt='%Y%m%d %H:%M:%S', filename=path+log_name,    filemode='ab+')
    return logging.basicConfig

log("postdata.log", dirs+'/')

def post_data(url, data):
    try:
        r = requests.post(url, data)
        if r.text:
            logging.info(r.text)
        else:
            logging.info("Server return http status code: {0}".format(r.status_code))
    except Exception as msg:
        logging.info(msg)
    return True
