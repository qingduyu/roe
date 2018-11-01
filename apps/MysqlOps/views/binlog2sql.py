
@login_required()
@permission_verify()
def binlog_parse(request):
    temp_name = "mysqlask/mysqlask-header.html"
    inslist = MySQL_Instance.objects.all().order_by("vist_ip")
    if request.method == 'POST':
        try:
            binlist = []
            dblist = []
            insname = MySQL_Instance.objects.get(id=int(request.POST['ins_set']))
            datalist, col = meta.get_process_data(insname, 'show binary logs')
            dbresult, col = meta.get_process_data(insname, 'show databases')
            if col != ['error']:
                for i in datalist:
                    binlist.append(i[0])
                for i in dbresult:
                    dblist.append(i[0])
            else:
                del binlist
                return render(request, 'mysqlask/binlog_parse.html', locals())
            if request.POST.has_key('show_binary'):
                return render(request, 'mysqlask/binlog_parse.html', locals())
            elif request.POST.has_key('parse'):
                binname = request.POST['binary_list']
                countnum = int(request.POST['countnum'])
                if countnum not in [10,50,200]:
                    countnum = 10
                # print countnum
                begintime = request.POST['begin_time']
                tbname = request.POST['tbname']
                dbselected = request.POST['dblist']
                tasks.parse_binlog.delay(insname, binname, begintime, tbname, dbselected,request.user.username,countnum,False)
                info = "Binlog REDO Parse mission uploaded"
            elif request.POST.has_key('parse_first'):
                binname = request.POST['binary_list']
                sqllist = tasks.parse_binlogfirst(insname, binname, 5)
            elif request.POST.has_key('parse_undo'):
                binname = request.POST['binary_list']
                countnum = int(request.POST['countnum'])
                if countnum not in [10, 50, 200]:
                    countnum = 10
                begintime = request.POST['begin_time']
                tbname = request.POST['tbname']
                dbselected = request.POST['dblist']
                tasks.parse_binlog.delay(insname, binname, begintime, tbname, dbselected, request.user.username, countnum,True)
                info = "Binlog UNDO Parse mission uploaded"
        except Exception,e:
            pass
        return render(request, 'mysqlask/binlog_parse.html', locals())
    else:
        return render(request, 'mysqlask/binlog_parse.html', locals())