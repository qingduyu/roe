# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth
from system.models import LarryMenus
import json
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt

@login_required(login_url='/login')
def index(request):
    try:
        menu_top = LarryMenus.objects.filter(pid_id__isnull=True).order_by('priority')
    except Exception as e:
        print(e)
    return render(request, 'index.html', locals())


#新的菜单获取方式，一次性全部获取
# @login_required(login_url='/login')
@csrf_exempt
def getmenu(request):
    try:
        menu_top = LarryMenus.objects.filter(pid__isnull=True)

        d1 = []

        for menu in menu_top:  # 顶级子菜单
            temdic = dict()
            temdic['title'] = menu.title
            temdic['id']=menu.id
            temdic['pid']=0
            temdic['icon'] = menu.icon
            temdic['url'] = menu.url
            temdic['spread'] = menu.spread
            temdic['param'] = menu.param
            temdic['condition'] = menu.condition
            smenus = LarryMenus.objects.filter(pid_id__exact=menu.id) #二级菜单

            if smenus.exists():
                d2 = []
                for smenu in smenus:
                    tempdic2 = dict()
                    tempdic2['id']=smenu.id
                    tempdic2['pid']=smenu.pid.id
                    tempdic2['title'] = smenu.title
                    tempdic2['icon'] = smenu.icon
                    tempdic2['url'] = smenu.url
                    tempdic2['spread'] = smenu.spread
                    tempdic2['param'] = smenu.param
                    tempdic2['condition'] = smenu.condition
                    tmenus = LarryMenus.objects.filter(pid_id__exact=smenu.id)  # 三级菜单
                    if tmenus.exists():
                        d3=[]
                        for tmenu in tmenus:
                            tempdic3 = dict()
                            tempdic3['id'] = tmenu.id
                            tempdic3['pid'] = tmenu.pid.id
                            tempdic3['title'] = tmenu.title
                            tempdic3['icon'] = tmenu.icon
                            tempdic3['url'] = tmenu.url
                            tempdic3['spread'] = tmenu.spread
                            tempdic3['param'] = tmenu.param
                            tempdic3['condition'] = tmenu.condition
                            fmenus = LarryMenus.objects.filter(pid_id__exact=tmenu.id)  # 四级菜单
                            if fmenus.exists():
                                d4=[]
                                for fmenu in fmenus:
                                    tempdic4 = dict()
                                    tempdic4['id'] = fmenu.id
                                    tempdic4['pid'] = fmenu.pid.id
                                    tempdic4['title'] = fmenu.title
                                    tempdic4['icon'] = fmenu.icon
                                    tempdic4['url'] = fmenu.url
                                    tempdic4['spread'] = fmenu.spread
                                    tempdic4['param'] = fmenu.param
                                    tempdic4['condition'] = fmenu.condition
                                    d4.append(tempdic4)
                                if d4:
                                    tempdic3['children']=d4
                            d3.append(tempdic3)
                        if d3:
                            tempdic2['children']=d3
                    d2.append(tempdic2)
                if d2:
                    temdic['children'] = d2
            d1.append(temdic)
        data = {"data": d1, "code": 1, "msg": "返回成功", }
        return HttpResponse(json.dumps(data), content_type="application/json")
    except Exception as e:
        print(e)



# 获取子菜单
def submenu(request, id):
    try:
        # 一级菜单
        submenus = LarryMenus.objects.get(id=id).menus_set.all()
    except Exception as e:
        print e
    d1 = []

    for menu in submenus:  # 子菜单
        temdic = dict()
        temdic['title'] = menu.title
        # temdic['menu1']=menu.menu1
        temdic['icon'] = menu.icon
        temdic['href'] = menu.href
        temdic['spread'] = menu.spread
        temdic['target'] = menu.target
        tmenus = LarryMenus.objects.filter(parent_id__exact=menu.id)

        if tmenus.exists():
            d2 = []
            for tmenu in tmenus:
                tempdic2 = dict()
                tempdic2['title'] = tmenu.title
                tempdic2['icon'] = tmenu.icon
                tempdic2['href'] = tmenu.href
                tempdic2['spread'] = tmenu.spread
                tempdic2['target'] = tmenu.target
                d2.append(tempdic2)

            if d2:
                temdic['children'] = d2
        d1.append(temdic)
    return HttpResponse(json.dumps(d1))


@login_required
def main(request):
    return render(request, 'console.html')


def codeing(request):
    return render(request, 'system/coding_page.html')


def login(request):
    if request.session.get('username') is not None:
        return HttpResponseRedirect('/', {"user": request.user})
    else:
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = auth.authenticate(username=username, password=password)
        if user and user.is_active:
            auth.login(request, user)
            request.session['username'] = username
            return HttpResponseRedirect('/', {"user": request.user})
        else:
            if request.method == "POST":
                return render(request, 'login.html', {"login_error_info": "用户名不存在，或者密码错误！", "username": username}, )
            else:
                return render(request, 'login.html')

@login_required()
def logout(request):
    auth.logout(request)
    return HttpResponseRedirect('/login')



@login_required()
def noperm(request):
    return render(request,'system/noperm.html',{"user":request.user})


def developing(request):
    return render(request, 'developing.html', locals())
