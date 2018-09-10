layui.define(['jquery', 'table', 'larryms'], function(exports) {
	var $ = layui.$,
		table = layui.table,
		larryms = layui.larryms;
	//按钮组监听
	$('.layui-btn-container .layui-btn').on('click', function() {
		var type = $(this).data('type'),
			url = $(this).data('url'),
			tit = $(this).children('cite').text();
		panelaction[type] ? panelaction[type].call(this) : '';
	});
	var panelaction = {
		reading: function() {
			//批量标记
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
					if (url == '') {
						larryms.alert('实际项目中请设置data-url参数为后端处理程序路径,查看源码注释');
					} else {
						//此处可以修改
						$.post(url, ids, function(res) {
							// # your coding
						})
					}
				}
			} else {
				larryms.msg('请至少选择一项，进行标记操作');
			}
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
						if (url == '') {
							larryms.alert('实际项目中请设置data-url参数为后端处理程序路径,具体方法已写在源码注释中');
						} else {
							//此处可以修改
							$.post(url, ids, function(res) {
								// # your coding
							})
						}
						// $.post(url, ids, function(res) {
						// 	if (res.code == 200) {
						// 		larryms.msg(res.msg);
						// 		table.reload(tableID, {
						// 			page: {
						// 				curr: 1
						// 			}
						// 		});
						// 	} else {
						// 		larryms.msg(res.msg);
						// 	}
						// });
					});

				}
			} else {
				larryms.msg('请至少选择一项，进行删除操作');
			}
		}
	};
	if (layui.cache.identified == 'message') {
		var mUrl = $('#message').data('url'),
			mIns = table.render({
				elem: '#message',
				id: "message",
				cellMinWidth: 95,
				url: mUrl,
				method: 'post',
				height: "full-155",
				page: true,
				limits: [15, 30, 45, 60, 75, 90, 105, 120],
				limit: 10,
				cols: [
					[{
						type: "checkbox",
						fixed: 'left',
						width: 40
					}, {
						field: 'title',
						title: '标题内容',
						minWidth: 260,
						align: 'left'
					}, {
						field: 'type',
						title: '消息类别',
						width: 180,
						align: 'center',
						templet: function(d) {
							if (d.type == '1') {
								return '<cite style="color:#01AAED;">系统消息</cite>';
							} else if (d.type == '2') {
								return '<cite style="color:#FF5722">重要提示</cite>';
							} else {
								return '<cite style="color:#009688;">站内消息</cite>';
							}
						}
					}, {
						field: 'status',
						title: '状态',
						width: 200,
						align: 'center',
						templet: function(d) {
							if (d.status == '1') {
								return '<input type="checkbox" name="zzz" lay-skin="switch" lay-text="已读|未读" checked>';
							} else {
								return '<input type="checkbox" name="zzz" lay-skin="switch" lay-text="已读|未读">';
							}
						}
					}, {
						field: 'time',
						title: '时间',
						width: 200,
						align: 'center'
					}]
				]
			});
	}
	exports('panel', {});
});