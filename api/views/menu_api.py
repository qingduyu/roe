#!/usr/bin/env python
# _#_ coding:utf-8 _*_

from UserOps.models import Menus

import json

def topmenu(request):

    try:
        menu_top=Menus.objects.filter(parent_id__gt=0)
    except Exception as e:
        print(e)

    return True