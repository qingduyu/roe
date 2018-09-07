# -*- coding: utf-8 -*-
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
from django.conf.urls import url,include
from django.contrib import admin
from index import index,main,login,logout,noperm
from index import submenu,codeing,getmenu
# from CMDB.views.db.oracle_api import OracleClusterViewset




from django.contrib.auth.models import User
from rest_framework import routers, serializers, viewsets
from rest_framework.urlpatterns import format_suffix_patterns

# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'is_staff')

# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
# router.register(r'users', UserViewSet)
# router.register(r'oraclecluster', OracleClusterViewset)




# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

urlpatterns = [
    url(r'^apitest/', include(router.urls)),
    url(r'^api/', include('api.urls')),
    url(r'^admin/', admin.site.urls),
    url(r'^login',login,name='login'),
    url(r'^logout', logout, name='logout'),
    url(r'^noperm', noperm, name='noperm'),
    url(r'^$',index,name='index' ), #代码首页会获取到顶级菜单
    url(r'^getmenu$', getmenu, name='getmenu'),

    # url(r'^getmenu/(?P<id>[0-9]+)/$',submenu,name='submenu'),  #点击子菜单后动态获取

    url(r'^codinghard',codeing,name='codinghard'),#正在努力开发代码中

    url(r'^console.html',main,name='page-main'),

    url(r'^cmdb/', include('CMDB.urls')),
    url(r'^system/', include('system.urls')),

    url(r'^test/',include('test.urls')),
    url(r'^api-auth',include('rest_framework.urls',namespace='rest_framework'))
]
# urlpatterns = format_suffix_patterns(urlpatterns)