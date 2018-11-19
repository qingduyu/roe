layui.define(['jquery','table', 'form','common'], function(exports) {
  var $ = layui.$,
    larryms = layui.larryms,
    common = layui.common,
    form = layui.form;
  table = layui.table;
  //按钮组监听
  $('.larryms-btn-group .layui-btn').on('click', function() {
      var type = $(this).data('type'),
        url = $(this).data('url'),
        tit = $(this).children('cite').text();
      active[type] ? active[type].call(this, url, tit) : '';
  });
  larryms.alert('您当前看到的菜单、权限、角色这一系列页面均只是临时的，待相关核心组件更新完成 会有多套菜单权限模板页供选择');
  var active = {
      add: function(url, tit) {
        var that = this;
        if ($(that).attr('data-flag') == 'exist') {
          var index = layui.cache.layerIndex,
              $max = $max = $('#layui-layer' + index).find('.layui-layer-maxmin');
          $max.click();
          layui.cache.layerIndex = null;
        } else {
          $(that).attr('data-flag', 'exist');
          var index = larryms.open({
            title: tit,
            type: 2,
            area: ['760px', '550px'],
            content: url,
            success: function(index, layero) {
              form.render();
            },
            end: function() {
              $(that).removeAttr("data-flag");
              layui.cache.layerIndex = null;
            }
          });

        }
      },
      del: function() {
        //批量删除
        var tableID = $(this).data('id'),
            checkStatus = table.checkStatus(tableID),
          data = checkStatus.data,
          newsId = [];
          console.log(tableID);
        var url = $(this).data('url');
        if (data.length > 0) {
          for (var i in data) {
            //排除默认管理员
             if(data[i].id !== 1){
                newsId.push(data[i].id);
             }
          }
          if(newsId.length>0){
              var ids = {"id":newsId};
              larryms.confirm('你确定要执行批量删除吗？',{icon: 3, title:'批量删除提示！'},function(){
                  $.post(url,ids,function(res){
                    if(res.code==200){
                      larryms.msg(res.msg);
                      table.reload(tableID,{
                         page:{
                           curr:1
                         }
                      });
                    }else{
                      larryms.msg(res.msg);
                    }
                  });
              });
          }else{
              larryms.msg('默认管理员不可删除,我是神一样的存在！');
          }
          
          
        } else {
          larryms.msg('请至少选择一项，进行删除操作');
        }
      }
    };


//搜索用户
    var pageTableID = $('.larryms-table-id').attr('id');
    $('#searchBtn').on('click', function() {
      var $searchVal = $('.searchVal').val();
      if ($searchVal !== '') {

        table.reload(pageTableID, {
          page: {
            curr: 1
          },
          where: {
            key: $searchVal
          }
        })
      } else {
        larryms.message('请输入要您要搜索的用户名');
      }
    });






  if (layui.cache.identified == 'userList') {
    var dataUrl = $('#adminuser').data('url'),
      userList = table.render({
        elem: '#adminuser',
        id: "adminuser",
        cellMinWidth: 95,
        url: dataUrl,
        method: 'post',
        height: "full-200",
        page: true,
        limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
        limit: 10,
        cols: [
          [{ 
              type: "checkbox",
              fixed: 'left',
              width: 50
            }, {
              field: 'uname',
              title: '用户名',
              minWidth: 80,
              align: 'center'
            }, {
              field: 'title',
              title: '所属组别',
              align: 'center',
              minWidth: 80
            }, {
              field: 'status',
              title: '用户状态',
              align: 'center',
              minWidth: 60,
              templet: function(d) {
                return d.status == "1" ? "正常" : "禁止登录";
              }
            },
             {
              field: 'login_num',
              title: '登录次数',
              align: 'center',
              minWidth: 60
            },
            {
              field: 'last_login_time',
              title: '最近登录时间',
              align: 'center',
              minWidth: 100,
              templet: function(d) {
                return d.last_login_time !== "undefined" ? d.last_login_time : "<span class='except-text'>从未登录过</span>";
              }
            }, {
              field: 'last_login_ip',
              title: '最后登录IP',
              align: 'center',
              minWidth: 80
            }, {
              field: 'create_time',
              title: '创建时间',
              align: 'center',
              minWidth: 100
            }, {
              title: '操作',
              minWidth: 115,
              templet: '#userListBar',
              fixed: "right",
              align: "center"
            }
          ]
        ]
      });


  } else if (layui.cache.identified == 'role') {
    // 来自角色用户组
        var tableDataUrl = $('#rolegroup').data('url'),
            roleIndex = table.render({
                 elem:'#rolegroup',
                 id:'rolegroup',
                 cellMinWidth:80,
                 url:tableDataUrl,
                 method:'post',
                 height:'full-130',
                 page:true,
                 limits:[10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                 limit:10,
                 cols:[
                   [{
                        type: "checkbox",
                        fixed: 'left',
                        width: 50
                    },{
                        field: 'title',
                        title: '角色名称',
                        minWidth: 80,
                        align: 'center'
                    }, {
                        field: 'status',
                        title: '角色状态',
                        minWidth: 80,
                        align: 'center',
                        templet: function(d) {
                            return d.status == "1" ? "正常" : "被限制";
                        }
                    },{
                        field: 'description',
                        title: '角色描述',
                        minWidth: 80,
                        align: 'center'
                    },{
                        field: 'create_time',
                        title: '创建时间',
                        minWidth: 80,
                        align: 'center'
                    },{
                        title: '操作',
                        minWidth: 115,
                        templet: '#roleBtnBar',
                        fixed: "right",
                        align: "center"
                    }]
                 ]
            });
  }else if(layui.cache.identified == 'grantauth'){


  }

// 监听工具条
table.on('tool('+pageTableID+')', function(obj) {
      var data = obj.data,
          tit='';
      if(layui.cache.identified == 'userList'){
          tit = '编辑 <em class="tit">'+data.username+ '</em> 的账号信息';
      }else if(layui.cache.identified == 'role'){
          tit = '编辑 <em class="tit">'+data.title+ '</em> 信息';
      }


      if(obj.event == 'edit'){
          var url =  $(this).data('url')+'?id='+data.id;
          
          var editIndex =  larryms.open({
              title: tit,
              type: 2,
              area: ['760px', '550px'],
              content: url,
              success: function(index, layero) {
                form.render();
              }
          });
      }else if(obj.event == 'del'){
          var url = $(this).data('url');
          larryms.confirm('你确定要删除该条数据吗？',{icon: 3, title:'删除提示'},function(){
              var ids = {"id":data.id};
              $.post(url,ids,function(res){
                  if(res.code==200){
                      larryms.msg(res.msg);
                      table.reload(pageTableID,{});
                  }else{
                     larryms.msg(res.msg);
                  }
              });
          });
      }else if(obj.event = 'grantauth'){
          var data = {
                        href: $(this).data('url'),
                        id: $(this).data('id'),
                        font: 'larry-icon',
                        icon: $(this).data('icon'),
                        group: $(this).data('group'),
                        title: '角色权限控制',
                        addType: 'iframe'
              };
              common.tab.addTab(data, 'iframe');
      }
});

  exports('auth', {});
});