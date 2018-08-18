# -*- coding: utf-8 -*-

#菜单管理
from django.shortcuts import render
from django.http import HttpResponse
from system.models import Menus
import json


def menulist(request):
    try:
        data=Menus.objects.all()
    except Exception as e:
        print(e)

    return render(request, 'system/menuops.html', locals())

def getmulist(request):
    menus = Menus.objects.all()
    count=Menus.objects.count()
    d1 = []

    for menu in menus:  # 子菜单
        temdic = dict()
        temdic["id"] =menu.id
        temdic["title"] = menu.title
        temdic["icon"] = menu.icon
        temdic["href"] = menu.href
        temdic["spread"] = menu.spread
        temdic["target"] = menu.target
        temdic["parent_id"] = menu.parent_id
        temdic["parent_copy"]=menu.parent_copy
        temdic["priority"]=menu.priority
        d1.append(temdic)

    # data1=json.dumps(d1)
    data={"data":d1,"code":0,"msg": "返回成功","count":count}
    return HttpResponse(json.dumps(data),content_type="application/json")