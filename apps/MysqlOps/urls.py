from django.conf.urls import url

# from .views import article_add,upload_image,article_edit,article_index
from roeops.settings import MEDIA_ROOT
from django.views.static import serve
from  MysqlOps.views import  binlog_parse
from MysqlOps.views.binlog_parse_api import BinlogRedoAPI
urlpatterns = [
    url(r'^binlog_parse/$', binlog_parse.binlog_parse,name='mysql_binglog_parse'),
    url(r'^binlog_redo_api/$', BinlogRedoAPI.as_view(), name='mysql_binglog_redo_api'),
#     url(r'^view/(?P<pid>[0-9]+)/$', views.article_show),
#     url(r'^edit/(?P<pid>[0-9]+)/$', views.article_edit),
#     url(r'^category/(?P<pid>[0-9]+)/$', views.article_category),
#     url(r'^tag/(?P<pid>[0-9]+)/$', views.article_tag),
#     url(r'^archive/(?P<month>([0-9]{4})/([0-9]{2}))/$', views.article_archive),
#     url(r'^upload/$', views.upload_image),
#     url(r'^upload/(?P<path>(\S)*)', serve, {'document_root': MEDIA_ROOT + 'wiki/'})
 ]