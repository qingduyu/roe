#-*- coding: utf-8 -*-
from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from django.http.response import JsonResponse
from CMDB.model.yewutree_model import YewuTreeMptt as YewuTree
from CMDB.model.server_models import Host
import json

Yezi_type = {
    "host": '/cmdb/yewu_host',
    'mysql': '/cmdb/yewu_mysql',
     "oracle": '/cmdb/yewu_oracle',
     'mongo': '/cmdb/yewu_mongo',
    "redis":  '/cmdb/yewu_redis',
    "tomcat": '/cmdb/yewu_tomcat',
}


#业务树
def yewu_tree(request):
    if request.method=='GET':
        yewu=YewuTree.objects.all()

        return  render(request, 'cmdb/yewutree/yewu_base.html',locals())
    elif request.method=='POST':
        '''拖拽的功能'''
        yewuid=request.POST['id']
        parentid=request.POST['newparentid']
        yewunode=YewuTree.objects.get(id=yewuid)
        parent=YewuTree.objects.get(id=parentid)
        if parent.isLast:
            return JsonResponse({'msg': "叶子节点是最后节点，不能移动到其下面", "code": 200, 'data': []})
        else:
            try:
                yewunode.parent=parent
                yewunode.save()
                return JsonResponse({'msg': "节点移动完成，请刷新页面查看", "code": 200, 'data': []})
            except Exception as e:
                print(e)
                return JsonResponse({'msg': "更新失败，看看是怎么会使", "code": 500, 'data': e })

#增加树枝节点（完成）
def yewu_tree_add_branch(request):
    if request.method=="GET":
        yewuid=request.GET.get('id')
        yewunode=YewuTree.objects.get(id=yewuid)
        return  render(request, 'cmdb/yewutree/yewu_tree_add_branch.html',locals())
    elif request.method=='POST':
        parentid = request.POST['parentid']
        node_name = request.POST['node_name']
        parent=YewuTree.objects.get(id=parentid)
        child=YewuTree.objects.get_or_create(name=node_name,parent=parent,isLast=False)
        return JsonResponse({'msg': "节点添加成功", "code": 200, 'data': []})

#增加叶子节点
def yewu_tree_add_leaf(request):
    '''
    添加叶子节点
    :param request:
    :return:
    '''
    if request.method=="GET":
        yewuid=request.GET.get('id')
        parentids=request.GET.get('parents').split(',')
        parentids.pop()#取出父节点并且删除业务树最顶段的2个节点,
        parentids.pop()
        parentids.append(yewuid)
        yewuxian=YewuTree.objects.filter(id__in=parentids)
        yewunode=YewuTree.objects.get(id=yewuid)
        yezi=Yezi_type
        return  render(request, 'cmdb/yewutree/yewu_tree_add_leaf.html',locals())
    elif request.method=='POST':
        parentid=request.POST['parentid']
        yewuxianid=request.POST['yewuxianID']
        yezitype=request.POST['yezi_type']
        href=Yezi_type[yezitype]

        try:
            parent=YewuTree.objects.get(id=parentid)
            yewuxian=YewuTree.objects.get(id=yewuxianid)
            child=YewuTree.objects.update_or_create(name=yezitype,parent=parent,yewuxian=yewuxian,href=href,isLast=True)
            return JsonResponse({'msg': "节点添加成功", "code": 200, 'data': []})
        except Exception as e:
            print(e)

#编辑叶子节点
def yewu_tree_edit_leaf(request):
    '''
    业务树的编辑
    :param request:
    :return:
    '''
    if request.method == 'GET':
        yewuid = request.GET.get('id')
        parentids = request.GET.get('parents').split(',')
        parentids.pop()  # 取出父节点并且删除业务树最顶段的2个节点,
        parentids.pop()
        yewuxian = YewuTree.objects.filter(id__in=parentids)
        yewunode = YewuTree.objects.get(id=yewuid)
        yewuxian_selected=yewunode.yewuxian.name
        return render(request, 'cmdb/yewutree/yewu_tree_edit_leaf.html', locals())
    elif request.method == 'POST':
        yewuid = request.POST['node_id']
        yewuxianid = request.POST['yewuxianID']
        yewu=YewuTree.objects.get(id=yewuid)
        yewuxian=YewuTree.objects.get(id=yewuxianid)
        yewu.yewuxian=yewuxian
        yewu.save()
        return JsonResponse({'msg': "节点添加成功", "code": 200, 'data': []})

#编辑树枝节点
def yewu_tree_edit_branch(request):
    '''
    业务树的编辑
    :param request:
    :return:
    '''
    if request.method == 'GET':
        yewuid = request.GET.get('id')
        yewunode=YewuTree.objects.get(id=yewuid)
        yewu=YewuTree.objects.all()
        return render(request, 'cmdb/yewutree/yewu_tree_edit_branch.html', locals())
    elif request.method=='POST':
        yewuid=request.POST['node_id']
        yewu=YewuTree.objects.get(id=yewuid)
        yewu_name=request.POST['node_name']
        yewu.name=yewu_name
        yewu.save()
        return JsonResponse({'msg': "节点编辑成功", "code": 200, 'data': []})

#删除树枝节点
def yewu_tree_delete(request):
    '''
    删除节点，注意删除关联业务数据，每次增加业务叶子的模板，这里的if判断条件就要相应的增加
    :param request:
    :return:
    '''
    print('daociyiyou')
    if request.method=='POST':
        yewuid=request.POST['id']
        yewu=YewuTree.objects.get(id=yewuid)

        yewu.delete()
        return JsonResponse({'msg': "节点删除成功", "code": 200, 'data': []})

        # if yewu.host_set or yewu.mysqlcluster_set or yewu.oraclecluster_set :
        #     return JsonResponse({'msg': "关联数据未删除，不能删除本节点", "code": 200, 'data': []})
        # else:
        #     yewu.delete()
        #     return JsonResponse({'msg': "节点删除成功", "code": 200, 'data': []})


# 这是json格式的树状结构
import  json
from mptt.templatetags.mptt_tags import cache_tree_children
def recursive_node_to_dict(node):
    result = {
        'id': node.pk,
        'title': node.name,
        'isLast':node.isLast,
        'level':node.mptt_level
    }
    children = [recursive_node_to_dict(c) for c in node.get_children()]
    if children:
        result['children'] = children
    return result

def yewutree2(request):

    root_nodes = cache_tree_children(YewuTree.objects.all())
    dicts = []
    for n in root_nodes:
        dicts.append(recursive_node_to_dict(n))

    jsonTree= json.dumps(dicts, indent=6)
    yewu=YewuTree.objects.all()

    return  render(request, 'cmdb/yewutree/yewu_base.html',locals())


def yewu_huizong(request):
    return render(request, 'cmdb/yewutree/yewu_huizong.html')


def yewu_server(request):
    ' 则是展示业务的的关联主机'
    if request.method=='GET':
        id=request.GET.get('id')
        try:
            host=Host.objects.filter(tree_id_id=id)
            yewuid=id
            return render(request, 'cmdb/yewutree/yewu_host.html',locals())
        except Exception as e:
            print e

def yewu_server_ops(request,id):
    '''进行主机和业务树的关联,post 方式传递2个参数,以后改成搜索多选框 ,一个是业务树的id,一个是主机的id'''
    #这里应该过滤资源吃
    if request.method=='GET':

        host=Host.objects.filter(tree_id__isnull=True ,is_pooled=True)
        yewuid=id
        return render(request, 'cmdb/yewutree/yewu_host_add.html',locals())
    elif request.method=="POST":
        hostid_list = request.POST['hostid'].split(',')
        yewuid = request.POST['yewuid']
        for i in hostid_list:
            host=Host.objects.get(id=i)
            host.tree_id_id=yewuid
            host.is_pooled=False
            host.save()
        json_data = {'code': 200, 'msg': '数据添加完毕'}
        return JsonResponse(json_data, content_type="application/json")


def yewu_mysql(request):
    return render(request, 'cmdb/yewutree/yewu_mysql.html',locals())

def yewu_oracle(request):

    if request.method=='GET':
        yewuid = request.GET.get('id')
        return render(request, 'cmdb/yewutree/yewu_oracle.html',locals())
    elif request.method=='POST':
        json_data = {'code': 200, 'msg': '数据添加完毕'}
        return JsonResponse(json_data, content_type="application/json")



def yewu_mongo(request):
    return render(request, 'cmdb/yewutree/yewu_mongo.html',locals())


def yewu_redis(request):
    return render(request, 'cmdb/yewutree/yewu_redis.html',locals())