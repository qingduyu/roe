#!/usr/bin/env python
#coding:utf-8
import logging.config
import  os
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR2 = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

CONF_LOG=BASE_DIR2+'/conf/logger.ini'
print(CONF_LOG)
logging.config.fileConfig(CONF_LOG)
logger = logging.getLogger("roeops")


if __name__=='__main__':
    logger.info(msg="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9")
    logger.error(msg="eyJ1c2VybmFtZSI6IndlbGxpYW0iLCJ1c2VyX2lkIjoyLCJlbWFpbCI6IjMwMzM1MDAxOUBxcS5jb20iLCJleHAiOjE1MTk2NTUzNTB9")