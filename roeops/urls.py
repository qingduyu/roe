"""roeops URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from index import index,main
from index import newslist,images,usercenter,sysbasicParameter,userchangePas,userGrade,syslogs,submenu

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$',index,name='index' ),
    url(r'^getmenu/(?P<id>[0-9]+)/$',submenu,name='submenu'),

    url(r'^page/main.html',main,name='page-main'),
    url(r'^page/news/newsList.html',newslist,name='newslist'),
    url('^page/img/images.html',images,name='images'),
    url('^page/user/userList.html',usercenter,name='userlist'),
    url('^page/systemSetting/basicParameter.html',sysbasicParameter,name='sysbasicParameter'),
    url('^page/user/changePwd.html',userchangePas,name='userchangepassword'),
    url('^page/user/userGrade.html',userGrade,name='usergrade'),
    url('^page/systemSetting/logs.html',syslogs,name='syslogs'),
]
