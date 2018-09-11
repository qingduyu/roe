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

