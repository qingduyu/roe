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
from utils.base import isIP




def ansbile_transfile(request):

    if request.method=='GET':
        # jsonTree2=jsonTree.replace(' ','').replace('\n','')
        ans_uuid=uuid.uuid4()
        time_now=time.strftime('%Y%m%d%H%M%S',time.localtime(time.time()))

     #无法同时渲染页面和传递json格式，渲染页面的编码和json编码是不一样的，因此只能通过异步的方式获取json格式数据
        return render(request,'opscontrol/exejobs/exe_transfile.html',locals())
    elif request.method=='POST':
        source_host=request.POST['source_host']

        if not isIP(source_host):
            return JsonResponse({'msg': "操作失败，源主机要是IP 地址", "code": 500, 'data': []})
        dest_hostid_list = request.POST['dest_hosts'].split(',')
        source_file = request.POST['source_file']
        dest_file = request.POST['dest_file']
        redisKey = request.POST['ans_uuid']
        try:
         ans_debug=request.POST['ans_debug']
        except:
            ans_debug='OFF'
        ip_list,hostlist=get_ans_host(dest_hostid_list)
        playbook_vars={}
        playbook_vars['dest_host']=ip_list
        playbook_vars['source_host']=source_host
        playbook_vars['source_file']=  source_file
        playbook_vars['dest_file'] = dest_file
        playbook_name= 'copy_file_between_remote.yaml'
        playbook_file = os.getcwd() + '/upload/selfuse/'+ playbook_name

        if DsRedis.OpsAnsiblePlayBookLock.get(redisKey=redisKey + '-locked') is None:  # 判断剧本是否有人在执行
            # 加上剧本执行锁
            DsRedis.OpsAnsiblePlayBookLock.set(redisKey=redisKey+ '-locked', value=request.user)
            # 删除旧的执行消息
            DsRedis.OpsAnsiblePlayBook.delete(redisKey)


            if ip_list:

                logId = AnsibleRecord.PlayBook.insert(user=str(request.user), ans_id=1,ans_name=playbook_name, ans_content="执行文件分发",ans_server=','.join(ip_list))

                # 执行ansible playbook
                if ans_debug == 'on':
                    ANS = ANSRunner(hostlist, redisKey=redisKey, logId=logId, verbosity=4)
                else:
                    ANS = ANSRunner(hostlist, redisKey=redisKey, logId=logId)

                ANS.run_playbook(host_list=ip_list, playbook_path=playbook_file, extra_vars=playbook_vars)
                # 获取结果
                result = ANS.get_playbook_result()
                dataList = []
                statPer = {
                    "unreachable": 0,
                    "skipped": 0,
                    "changed": 0,
                    "ok": 0,
                    "failed": 0
                }
                for k, v in result.get('status').items():
                    v['host'] = k
                    if v.get('failed') > 0 or v.get('unreachable') > 0:
                        v['result'] = 'Failed'
                    else:
                        v['result'] = 'Succeed'
                    dataList.append(v)
                    statPer['unreachable'] = v['unreachable'] + statPer['unreachable']
                    statPer['skipped'] = v['skipped'] + statPer['skipped']
                    statPer['changed'] = v['changed'] + statPer['changed']
                    statPer['failed'] = v['failed'] + statPer['failed']
                    statPer['ok'] = v['ok'] + statPer['ok']
                DsRedis.OpsAnsiblePlayBook.lpush(redisKey, "[Done] Ansible Done.")
                # 切换版本之后取消项目部署锁
                DsRedis.OpsAnsiblePlayBookLock.delete(redisKey=redisKey + '-locked')
                return JsonResponse({'msg': "操作成功", "code": 200, 'data': dataList, "statPer": statPer},content_type='application/json')

        else:

                return JsonResponse({'msg': "操作失败，有任务正在执行", "code": 500, 'data': []},content_type='application/json')




