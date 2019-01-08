#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render


from MysqlOps.models import MysqlFastSQL,SQL_EXEC
from django.contrib.auth.decorators import login_required
from CMDB.model.yewutree_model import YewuTreeMptt as YewuTree
from system.models import UserProfile

@login_required()
def MyfastSQL_list(request):
    return render(request, 'dbops/mysql/MyfastSQL_list.html')

@login_required()
def MyfastSQL_add(request):
    sql_exec_typ=SQL_EXEC
    return render(request, 'dbops/mysql/MyfastSQL_add.html',locals())


@login_required()
def MyfastSQL_edit(request):
    id=request.GET['id']
    data = MysqlFastSQL.objects.get(id=id)
    sql_exec_typ=SQL_EXEC
    return render(request, 'dbops/mysql/MyfastSQL_edit.html',locals())