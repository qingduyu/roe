from django.conf.urls import url
from api.views import user_api    

urlpatterns = [
            url(r'^group/$', assets_api.group_list),
            url(r'^group/(?P<id>[0-9]+)/$',assets_api.group_detail),
            url(r'^user/$', user_api.user_list),
            url(r'^user/(?P<id>[0-9]+)/$',user_api.user_detail),
]