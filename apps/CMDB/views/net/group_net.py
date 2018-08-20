# #! /usr/bin/env python
# # -*- coding: utf-8 -*-
#
# from django.shortcuts import render
# # from net_models import NetDevice, NetGroup
# from CMDB.forms.net_forms import GroupForm, IdcForm
# from django.contrib.auth.decorators import login_required
#
#
#
# @login_required()
# def group(request):
#     temp_name = "netcmdb/netcmdb-header.html"
#     allgroup = NetGroup.objects.all()
#     context = {
#         'temp_name': temp_name,
#         'allgroup': allgroup
#     }
#     return render(request, 'CMDB/net/group_net.html', context)
#
#
# @login_required()
# def group_add(request):
#     temp_name = "netcmdb/netcmdb-header.html"
#     if request.method == "POST":
#         group_form = GroupForm(request.POST)
#         if group_form.is_valid():
#             group_form.save()
#             tips = u"增加成功！"
#             display_control = ""
#         else:
#             tips = u"增加失败！"
#             display_control = ""
#         return render(request, "CMDB/net/group_net_add.html", locals())
#     else:
#         display_control = "none"
#         group_form = GroupForm()
#         idc_form = IdcForm()
#         return render(request, "CMDB/net/group_net_add.html", locals())
#
#
# @login_required()
# def group_del(request):
#     temp_name = "netcmdb/netcmdb-header.html"
#     if request.method == 'POST':
#         group_items = request.POST.getlist('g_check', [])
#         if group_items:
#             for n in group_items:
#                 NetGroup.objects.filter(id=n).delete()
#     allgroup = NetGroup.objects.all()
#     return render(request, "CMDB/net/group_net.html", locals())
#
#
# @login_required()
# def group_edit(request, ids):
#     obj = NetGroup.objects.get(id=ids)
#     allgroup = NetGroup.objects.all()
#     unselect = NetDevice.objects.filter(group__name=None)
#     members = NetDevice.objects.filter(group__name=obj.name)
#     return render(request, "CMDB/net/group_net_edit.html", locals())
#
#
# @login_required()
# def group_save(request):
#     temp_name = "netcmdb/netcmdb-header.html"
#     if request.method == 'POST':
#         group_id = request.POST.get('id')
#         name = request.POST.get('name')
#         desc = request.POST.get('desc')
#         members = request.POST.getlist('members', [])
#         unselect = request.POST.getlist('unselect', [])
#         group_item = NetGroup.objects.get(id=group_id)
#         if unselect:
#             for netdevice in unselect:
#                 # print "unselect: "+host
#                 obj = NetDevice.objects.get(devicename=netdevice)
#                 obj.group_id = None
#                 obj.save()
#         if members:
#             for netdevice in members:
#                 # print "members: "+host
#                 obj = NetDevice.objects.get(hostname=netdevice)
#                 obj.group_id = group_id
#                 obj.save()
#         group_item.name = name
#         group_item.desc = desc
#         group_item.save()
#         obj = group_item
#         status = 1
#     else:
#         status = 2
#     return render(request, "CMDB/net/group_net_edit.html", locals())
