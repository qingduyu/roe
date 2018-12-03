
from django.conf.urls import url,include

from cron import cron_add,cron_list,cron_config,cron_log,cron_mod

from ansible_ops import (apps_list,apps_online,apps_script_online,apps_script_list,apps_script_file,
                         apps_script_online_run,ansible_run,ansible_log,ansible_log_view,apps_upload,apps_playbook_run,
                         apps_playbook_file,apps_playbook_modf,apps_playbook_online_modf,ansible_inventory,ansible_inventory_modf,
                         ansible_inventory_groups,ansible_inventory_groups_server)

from task import task_model,task_search,task_view

from views.exe_modules import exe_modules
from views.exe_script import exe_script

urlpatterns = [

    url(r'^cron_add', cron_add,name='crontable_add'),
    url(r'^cron_list/(?P<page>[0-9]+)/$', cron_list,name='crontab_list'),
    url(r'^cron_config', cron_config,name='crontab_config'),
    url(r'^cron_log/(?P<page>[0-9]+)/$',cron_log,name='crontab_log'),
    url(r'^cron_mod/(?P<cid>[0-9]+)/$', cron_mod,name='crontab_modify'),

    url(r'^apps/$', apps_list),
    # url(r'^apps/model/$', apps_model),
    url(r'^apps/script/online/$', apps_script_online),
    url(r'^apps/script/list/$', apps_script_list),
    url(r'^apps/script/file/(?P<pid>[0-9]+)/$', apps_script_file),
    url(r'^apps/script/run/(?P<pid>[0-9]+)/$', apps_script_online_run),

    url(r'^apps/log/$', ansible_log),
    url(r'^apps/log/(?P<model>[a-z]+)/(?P<id>[0-9]+)/$', ansible_log_view),
    url(r'^apps/playbook/upload/$', apps_upload),
    url(r'^apps/playbook/online/$', apps_online),
    url(r'^apps/playbook/file/(?P<pid>[0-9]+)/$', apps_playbook_file),
    url(r'^apps/playbook/run/(?P<pid>[0-9]+)/$', apps_playbook_run),
    url(r'^apps/playbook/modf/(?P<pid>[0-9]+)/$', apps_playbook_modf),
    url(r'^apps/playbook/online/modf/(?P<pid>[0-9]+)/$', apps_playbook_online_modf),
    url(r'^apps/inventory/$', ansible_inventory),
    url(r'^apps/inventory/modf/(?P<id>[0-9]+)/$', ansible_inventory_modf),
    url(r'^apps/inventory/groups/(?P<id>[0-9]+)/$', ansible_inventory_groups),
    url(r'^apps/inventory/groups/server/(?P<id>[0-9]+)/$', ansible_inventory_groups_server),


    url(r'^task_model/$', task_model),
    url(r'^task_view/$', task_view),
    url(r'^task_search/$',task_search),

    url(r'^ansible_exe_modules/$', exe_modules,name='ansible_exe_modules'),
    url(r'^ansible_exe_script/$', exe_script, name='ansible_exe_script'),
    url(r'^get_ans_run_result/$', ansible_run,name='get_ans_run_result'),
]