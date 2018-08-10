# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse
from UserOps.models import Menus
import json
def index(request):
    try:
        menu_top=Menus.objects.filter(parent_id__isnull=True).order_by('priority')
    except Exception as e:
        print(e)
    return  render(request,'index.html',locals())


#获取子菜单
def submenu(request,id):
        try:
            #一级菜单
            submenus = Menus.objects.get(id=id).menus_set.all()
        except Exception as e:
            print e
        d1 = []

        for menu in submenus:   #子菜单
            temdic = dict()
            temdic['title']=menu.title
            # temdic['menu1']=menu.menu1
            temdic['icon']=menu.icon
            temdic['href']=menu.href
            temdic['spread']=menu.spread
            temdic['target']=menu.target
            tmenus=Menus.objects.filter(parent_id__exact=menu.id)

            if tmenus.exists():
                d2=[]
                for tmenu in tmenus:
                    tempdic2 = dict()
                    tempdic2['title']=tmenu.title
                    tempdic2['icon'] = tmenu.icon
                    tempdic2['href'] = tmenu.href
                    tempdic2['spread'] = tmenu.spread
                    tempdic2['target'] = tmenu.target
                    d2.append(tempdic2)

                if d2:
                    temdic['children'] = d2
            d1.append(temdic)
        return HttpResponse(json.dumps(d1))



        #以下为案例展示
def main(request):
    return  render(request,'page/main.html')

def newslist(request):
    return  render(request,'page/news/newsList.html')


def images(request):
    return  render(request,'page/img/images.html')

def usercenter(request):
    return  render(request,'page/user/userList.html')

def sysbasicParameter(request):
    return  render(request,'page/systemSetting/basicParameter.html')

def userchangePas(request):
    return render(request, 'page/user/changePwd.html')

def userGrade(request):
    return render(request, 'page/user/userGrade.html')

def syslogs(request):
    return render(request, 'page/systemSetting/logs.html')