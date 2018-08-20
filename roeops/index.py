# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib import auth
from system.models import Menus
import json
from django.contrib.auth.decorators import login_required


@login_required(login_url='/login')
def index(request):
    try:
        menu_top = Menus.objects.filter(parent_id__isnull=True).order_by('priority')
    except Exception as e:
        print(e)
    return render(request, 'index.html', locals())


# 获取子菜单
def submenu(request, id):
    try:
        # 一级菜单
        submenus = Menus.objects.get(id=id).menus_set.all()
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
        tmenus = Menus.objects.filter(parent_id__exact=menu.id)

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
    return render(request, 'main.html')


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