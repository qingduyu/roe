layui.define(['larry', 'table', 'form'], function(exports) {
  var $ = layui.$,
    larry = layui.larry,
    larryms = layui.larryms,
    form = layui.form,
    MOD_NAME = 'system';
  table = layui.table;
  var pageTableID = $('.larryms-table-id').attr('id');
  //按钮组监听
  $('.larryms-btn-group .layui-btn').on('click', function() {
    var type = $(this).data('type'),
      url = $(this).data('url'),
      tit = $(this).children('cite').text();
    active[type] ? active[type].call(this, url, tit) : '';
  });

  var active = {
    group: function(url, tit) {
      var groupIndex = larryms.open({
        title: tit,
        type: 2,
        shadeClose: true,
        area: ['760px', '550px'],
        content: url,
        success: function(index, layero) {

        },
        end: function() {

        }
      });
    },
    add: function(url, tit) {
      var confAdd = larryms.open({
        title: tit,
        type: 2,
        shadeClose: true,
        area: ['780px', '660px'],
        content: url,
        success: function(index, layero) {

        },
        end: function() {

        }
      });
    },
    edit: function() {

    },
    del: function() {
      //批量删除
      var tableID = $(this).data('id'),
        checkStatus = table.checkStatus(tableID),
        data = checkStatus.data,
        newsId = [];

      var url = $(this).data('url');
      if (data.length > 0) {
        for (var i in data) {
          newsId.push(data[i].id);
        }
        if (newsId.length > 0) {
          var ids = {
            "id": newsId
          };
          larryms.confirm('你确定要执行批量删除吗？', {
            icon: 3,
            title: '批量删除提示！'
          }, function() {
            $.post(url, ids, function(res) {
              if (res.code == 200) {
                larryms.msg(res.msg);
                table.reload(tableID, {
                  page: {
                    curr: 1
                  }
                });
              } else {
                larryms.msg('需设置后端处理程序url路径，请查看源码注释');
              }
            });
          });
        }
      } else {
        larryms.msg('请至少选择一项，进行删除操作');
      }
    }
  };


  if (layui.cache.identified == 'conf') {
    var dataUrl = $('#systemConf').data('url'),
      conf = table.render({
        elem: '#systemConf',
        id: "systemConf",
        cellMinWidth: 50,
        url: dataUrl,
        method: 'post',
        height: "full-200",
        page: true,
        limits: [15, 30, 45, 60, 75, 90, 105, 120, 135, 150],
        limit: 15,
        cols: [
          [{
            type: "checkbox",
            fixed: 'left',
            width: 50
          }, {
            field: 'name',
            title: '配置项',
            minWidth: 120,
            align: 'left'
          }, {
            field: 'title',
            title: '中文名称',
            minWidth: 100,
            align: 'center'
          }, {
            field: 'dtype',
            title: '配置项类型',
            minWidth: 80,
            templet: '#dataType',
            align: 'center'
          }, {
            field: 'gname',
            title: '所属配置分组',
            minWidth: 150,
            align: 'center'
          }, {
            field: 'values',
            title: '配置项默认值',
            minWidth: 80,
            align: 'center'
          }, {
            field: 'op_values',
            title: '配置项默认可选值值',
            minWidth: 80,
            align: 'center'
          }, {
            field: 'sort',
            title: '排序',
            minWidth: 80,
            align: 'center'
          }, {
            field: 'remark',
            title: '备注',
            minWidth: 150,
            align: 'center'
          }, {
            title: '操作',
            minWidth: 115,
            templet: '#confBar',
            fixed: "right",
            align: "center"
          }]
        ]
      });

  } else if (layui.cache.identified == 'add') {

  } else if (layui.cache.identified == 'edit') {

  } else if (layui.cache.identified == 'del') {

  } else if (layui.cache.identified == 'group') {
    var dataUrl = $('#systemConfGroup').data('url'),
      groupTableIn = table.render({
        elem: '#systemConfGroup',
        id: "systemConfGroup",
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
            field: 'group_name',
            title: '分组名称',
            minWidth: 200,
            align: 'center'
          }, {
            field: 'is_extend',
            title: '是否为扩展配置分组',
            minWidth: 100,
            align: 'center',
            templet: '#isextendBar',
          }, {
            field: 'remark',
            title: '配置分组说明',
            minWidth: 200,
            align: 'left'
          }, {
            field: 'sort',
            title: '配置分组排序',
            minWidth: 80,
            align: 'center'
          }, {
            field: 'create_time',
            title: '创建时间',
            minWidth: 130,
            align: 'center'
          }, {
            field: 'update_time',
            title: '更新时间',
            minWidth: 130,
            align: 'center'
          }, {
            title: '操作',
            minWidth: 130,
            templet: '#confBar',
            fixed: "right",
            align: "center"
          }]
        ]
      });
  }

  // 监听工具条
  table.on('tool(' + pageTableID + ')', function(obj) {
    var data = obj.data;
    if (obj.event == 'edit') {
      var url = $(this).data('url') + '?id=' + data.id;
      var editIndex = larryms.open({
        type: 2,
        skin: 'larryms-navy',
        title: '编辑',
        area: ['760px', '726px'],
        shadeClose: true,
        shade: 0.2,
        offset: '20px',
        maxmin: true,
        btnAlign: 'c',
        content: url,
        success: function(index, layero) {}
      });
    } else if (obj.event == 'del') {
      var url = $(this).data('url');
      larryms.confirm('你确定要删除该条数据吗？', {
        icon: 3,
        title: '删除提示'
      }, function() {
        var ids = {
          "id": data.id
        };
        $.post(url, ids, function(res) {
          if (res.code == 200) {
            larryms.msg(res.msg);
            table.reload(pageTableID, {});
          } else {
            larryms.msg(res.msg);
          }
        });
      });
    }
  });
  exports(MOD_NAME, {});
});