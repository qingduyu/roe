layui.define(['larryms', 'table'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms;
	table = layui.table;

	var url = $('#log').data('url'),
		logIns = table.render({
			elem: '#log',
			id: "log",
			cellMinWidth: 95,
			url: url,
			method: 'post',
			height: "full-185",
			page: true,
			limits: [15, 30, 45, 60, 75, 90, 105, 120],
			limit: 10,
			cols: [
				[{
					type: "checkbox",
					fixed: 'left',
					width: 40
				}, {
					field: 'username',
					title: '用户',
					width: 130,
					align: 'center'
				}, {
					field: 'title',
					title: '日志内容',
					minWidth: 140,
					align: 'center'
				}, {
					field: 'url',
					title: '访问路径',
					minWidth: 130,
					align: 'center'
				}, {
					field: 'ip',
					title: 'IP地址',
					width: 150,
					align: 'center'
				}, {
					field: 'browser',
					title: '浏览器',
					width: 160,
					align: 'center'
				}, {
					field: 'time',
					title: '操作时间',
					width: 200,
					align: 'center',
					sort: true
				}]
			]
		});
	//按钮组监听
	$('.layui-btn-group .layui-btn').on('click', function() {
		var type = $(this).data('type'),
			url = $(this).data('url'),
			tit = $(this).children('cite').text();
		action[type] ? action[type].call(this) : '';
	});
	var action = {
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
		},
		refresh: function() {
			var tableID = $(this).data('id'),
				tabUrl = $('#' + tableID).data('url');
			console.log(tableID);
			table.reload(tableID, {
				url: tabUrl,
				where: {
					//可设定异步数据接口的额外参数
				},
				initSort: {//刷新重载设定初始排序
					field: 'username', //排序字段，对应 cols 设定的各字段名
					type: 'desc' //排序方式  asc: 升序、desc: 降序、null: 默认排序
				}
			});
		}
	};
	exports('log', {});
});