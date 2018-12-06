# 鱼子运维
是集众多开源技术，结合作者的使用经验，融合改造而成，因此做成之时会回馈网络


## 正在初步开发中，版本迭代很快。使用说明一边开发一边添加
模块规划比较独立，可以每人承担一个功能包的开发任务，欢迎一起开发
菜单栏目是动态从数据库获取。等待功能稍微完善一点，放出SQL初始化语句




安装部署：
1. 依赖软件
yum install sshpass,nmap,supervisor

2. 部署python:

3. 部署mysql

4. 部署 redis

## 5. 部署 celery


 #export PYTHONOPTIMIZE=1
 #vim /etc/supervisord.conf
文件最后添加

;三个工人处理队列\
[program:celery-worker-default]\
command=/usr/bin/python mana``ge.py celery worker --loglevel=info -E -Q default\
directory=/data/PycharmProject/roeops\
stdout_logfile=/data/PycharmProject/roeops/logs/celery-worker-default.log\
autostart=true\
autorestart=true\
redirect_stderr=true\
stopsignal=QUIT\
numprocs=1\

[program:celery-worker-ansible]\
command=/usr/bin/python manage.py celery worker --loglevel=info -E -Q ansible\
directory=/data/PycharmProject/roeops\
stdout_logfile=/data/PycharmProject/roeops/logs/celery-worker-ansible.log\
autostart=true\
autorestart=true\
redirect_stderr=true\
stopsignal=QUIT\
numprocs=1\

[program:celery-worker-database]

command=/usr/bin/python manage.py celery worker --loglevel=info -E -Q database

directory=/data/PycharmProject/roeops

stdout_logfile=/data/PycharmProject/roeops/logs/celery-worker-database.log

autostart=true

autorestart=true

redirect_stderr=true

stopsignal=QUIT

numprocs=1

;Celery默认任务单元由任务生产者触发,但有时可能需要其自动触发,而Beat进程正是负责此类任务,能够自动触发定时/周期性任务.

[program:celery-beat]

command=/usr/bin/python manage.py celery beat

directory=/data/PycharmProject/roeops

stdout_logfile=/data/PycharmProject/roeops/logs/celery-beat.log

autostart=true

autorestart=true

redirect_stderr=true

stopsignal=QUIT

numprocs=1

;对事件进行快照，就是监控事件的工作情况，默认1秒一个，可以调整

[program:celery-cam]

command=/usr/bin/python manage.py celerycam --frequency=0.5

directory=/data/PycharmProject/roeops

stdout_logfile=/data/PycharmProject/roeops/logs/celery-celerycam.log

autostart=true

autorestart=true

redirect_stderr=true

stopsignal=QUIT

numprocs=1


# 启动celery 守护进程

/usr/bin/supervisord -c /etc/supervisord.conf\
supervisorctl status #检查是否running状态
'''
#关于 supervisord 使用


supervisorctl update #更新新的配置到supervisord

supervisorctl reload #重新启动配置中的所有程序

supervisorctl start program_name #启动某个进程(program_name=你配置中写的程序名称)

supervisorctl #查看正在守候的进程

pervisorctl stop program_name 停止某一进程 (program_name=你配置中写的程序名称)

supervisorctl restart program_name #重启某一进程 (program_name=你配置中写的程序名称)

supervisorctl stop all #停止全部进程
‘’‘
# 部分截图

![image](https://github.com/qingduyu/roe/blob/master/demo_image/login3.gif)


![image](https://github.com/qingduyu/roe/blob/master/demo_image/demo1.jpg)

![image](https://github.com/qingduyu/roe/blob/master/demo_image/demo2.jpg)
![image](https://github.com/qingduyu/roe/blob/master/demo_image/demo3.jpg)
![image](https://github.com/qingduyu/roe/blob/master/demo_image/demo4.jpg)
![image](https://github.com/qingduyu/roe/blob/master/demo_image/demo5.jpg)