#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from CMDB.model.oracle_modles import OracleUser,Oracle_Instance,Oracletablespace,OracleCluster
from django.contrib.auth.decorators import login_required


@login_required()
def oracle_cluster(request):
    return render(request, 'cmdb/db/oracle_cluster.html')

@login_required()
def oracle_cluster_add(request):
    return render(request, 'cmdb/db/oracle_cluster_add.html')


@login_required()
def oracle_cluster_edit(request,id):
    data = OracleCluster.objects.get(id=id)
    return render(request, 'cmdb/db/oracle_cluster_edit.html',locals())

#####################################

@login_required()
def oracle_cluster_instance(request):
    return render(request, 'cmdb/db/oracle_instance.html')


@login_required()
def oracle_cluster_instance_add(request):
    return render(request, 'cmdb/db/oracle_instance_add.html')

@login_required()
def oracle_cluster_instance_edit(request,id):
    data=Oracle_Instance.objects.get(id=id)
    return render(request, 'cmdb/db/oracle_instance_edit.html',locals())
####################################################################

@login_required()
def oracle_cluster_user(request):
    return render(request, 'cmdb/db/oracle_user.html')


@login_required()
def oracle_cluster_user_add(request):
    return render(request, 'cmdb/db/oracle_user_add.html')

@login_required()
def oracle_cluster_user_edit(request,id):
    data=OracleUser.objects.get(id=id)
    return render(request, 'cmdb/db/oracle_user_edit.html',locals())

##############################################################
@login_required()
def oracle_cluster_tablespace(request):
    return render(request, 'cmdb/db/oracle_tablespace.html')


@login_required()
def oracle_cluster_tablespace_add(request):
    return render(request, 'cmdb/db/oracle_tablespace_add.html')

@login_required()
def oracle_cluster_tablespace_edit(request,id):
    data=Oracletablespace.objects.get(id=id)
    return render(request, 'cmdb/db/oracle_tablespace_edit.html',locals())
