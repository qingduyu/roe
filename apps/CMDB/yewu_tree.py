#-*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse
from CMDB.model.yewutree_model import YewuTree

import json
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
def yewu_tree(request):

    # tree_data={
    #   {'name':u"常用文件夹",'id': 1 ,'alias':u"changyong", 'children': [
    #                         {u"name":u"所有未读",u'id': '11' ,u'href': u'http://www.layui.com/' ,u'alias': u'weidu'},
    #                         {u'name': u'置顶邮件' ,u'id': '12'},
    #                         {u'name': u'标签邮件',u'id': '13'}]
    #   },
    #   {u'name': u'我的邮箱' ,u'id': 2 ,u'spread': u'true' ,u'children': [
    #       {
    #         u'name': u'QQ邮箱'
    #         ,u'id': 21
    #         ,u'spread': u'false'
    #         ,u'children': [
    #           {
    #             u'name': u'收件箱'
    #             ,u'id': 211
    #             ,u'children': [
    #               {u'name': u'所有未读'  ,u'id': 2111}, { u'name': u'置顶邮件'  ,u'id': 2112}, { u'name': u'标签邮件' ,'id': 2113}
    #             ]
    #           }, {
    #             u'name': u'已发出的邮件'
    #             ,u'id': 212
    #           }, {
    #             u'name': u'垃圾邮件'
    #             ,u'id': 213
    #           }
    #         ]
    #       }, {
    #         u'name': u'阿里云邮箱'
    #         ,u'id': 22
    #         ,u'children': [
    #           {
    #             u'name': u'收件夹'
    #             ,u'id': 221
    #           }, {
    #             u'name': u'已发出的邮件'
    #             ,'id': 222
    #           }, {
    #             u'name': u'垃圾邮件'
    #             ,u'id': 223
    #           }
    #         ]
    #       }
    #     ]
    #   }
    #
    # }
    # tree_data=json.dumps(tree_data)
    yewu=YewuTree.objects.all()

    return  render(request, 'cmdb/yewutree/yewu_base.html', locals())


def yewu_server(request):
    return render(request, 'cmdb/yewutree/yewu_server.html')


def yewu_mysql(request):
    return render(request, 'cmdb/yewutree/yewu_mysql.html')

def yewu_oracle(request):
    return render(request, 'cmdb/yewutree/yewu_oracle.html')