#!/usr/bin/env python
# _#_ coding:utf-8 _*_

import uuid,os,json
from django.http import HttpResponseRedirect,HttpResponse
from django.http.response import JsonResponse,Http404
from rest_framework.response import Response
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from CMDB.model.server_models import Host
from CMDB.model.yewutree_model import YewuTreeMptt
from utils.data.DsRedisOps import DsRedis
from utils.data.DsMySQL import AnsibleRecord
from OpsControl.models import Log_Ansible_Model
from OpsControl.ans_hosts import get_ans_host
from utils.logger import logger
from utils.ansible_api_v2 import ANSRunner
import time


def exe_script(request):

    if request.method=='GET':
        # jsonTree2=jsonTree.replace(' ','').replace('\n','')
        ans_uuid=uuid.uuid4()
        time_now=time.strftime('%Y%m%d%H%M%S',time.localtime(time.time()))

     #无法同时渲染页面和传递json格式，渲染页面的编码和json编码是不一样的，因此只能通过异步的方式获取json格式数据
        return render(request,'opscontrol/exejobs/exe_scripts.html',locals())
    elif request.method=='POST':
        def saveScript(content,filePath):
            if os.path.isdir(os.path.dirname(filePath)) is not True:
                os.makedirs(os.path.dirname(filePath))#判断文件存放的目录是否存在，不存在就创建
            with open(filePath, 'w') as f:
                f.write(content)
            return filePath
        hostid_list = request.POST['hosts'].split(',')

        redisKey = request.POST['ans_uuid']
        script_name = request.POST['script_name']
        script_content = request.POST['script_content']
        ansible_args=request.POST['script_args']
        try:
         ans_debug=request.POST['ans_debug']
        except:
            ans_debug='OFF'
        ip_list,hostlist=get_ans_host(hostid_list)
        if ip_list:
            filePath = saveScript(content=script_content, filePath='/tmp/{filename}'.format(filename=script_name))

            logId = AnsibleRecord.Model.insert(user=str(request.user), ans_model='script',ans_server=','.join(ip_list), ans_args=filePath)

            DsRedis.OpsAnsibleModel.delete(redisKey)
            DsRedis.OpsAnsibleModel.lpush(redisKey, "[Start] Ansible Model: {model}  Script:{filePath} {args}".format(
                model='script', filePath=filePath, args=ansible_args))
            if ans_debug == 'on':
                ANS = ANSRunner(hostlist, redisKey, logId, verbosity=4)
            else:
                ANS = ANSRunner(hostlist, redisKey, logId)


            ANS.run_model(host_list=ip_list, module_name='script',  module_args="{filePath} {args}".format(filePath=filePath,
                                                                 args=ansible_args))
            DsRedis.OpsAnsibleModel.lpush(redisKey, "[Done] Ansible Done.")

            try:
                os.remove(filePath)
            except Exception, ex:
                logger.warn(msg="删除文件失败: {ex}".format(ex=ex))
            return JsonResponse({'msg': "操作成功", "code": 200, 'data': []})
        else:

            return JsonResponse({'msg': "操作失败，未选择主机或者该分组没有成员", "code": 500, 'data': []})




