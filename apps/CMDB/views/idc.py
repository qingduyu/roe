#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from CMDB.model.idc_models import Idc
from django.contrib.auth.decorators import login_required


#IDC机房管理的界面

@login_required()
def idc_show(request):
    return render(request, 'cmdb/idc/idc_show.html')




@login_required()
def idc_add(request):
   return render(request, "cmdb/idc/idc_add.html",locals())




@login_required()
def idc_edit(request, id):
    data = Idc.objects.get(id=id)
    return render(request, "cmdb/idc/idc_edit.html", locals())

#
# @login_required()
# def idc_save(request):
#
#     if request.method == 'POST':
#         idc_id = request.POST.get('id')
#         mini = request.POST.get('idc_mini')
#         name = request.POST.get('name')
#         address = request.POST.get('address')
#         tel = request.POST.get('tel')
#         contact = request.POST.get('contact')
#         contact_phone = request.POST.get('contact_phone')
#         jigui = request.POST.get('jigui')
#         ip_range = request.POST.get('ip_range')
#         bandwidth = request.POST.get('bandwidth')
#         idc_item = Idc.objects.get(id=idc_id)
#         idc_item.name = name
#         idc_item.address = address
#         idc_item.tel = tel
#         idc_item.contact = contact
#         idc_item.contact_phone = contact_phone
#         idc_item.jigui = jigui
#         idc_item.ip_range = ip_range
#         idc_item.bandwidth = bandwidth
#         idc_item.save()
#         obj = idc_item
#         status = 1
#     else:
#         status = 2
#     return render(request, "cmdb/idc/idc_edit.html", locals())