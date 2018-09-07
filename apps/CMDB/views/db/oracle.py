#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render

from CMDB.model.oracle_modles import OracleUser,Oracle_Instance,Oracletablespace,OracleCluster
from django.contrib.auth.decorators import login_required




@login_required()
def oracle_cluster_show(request):
    return render(request, 'cmdb/db/oracle_cluster.html')

