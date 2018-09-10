layui.define(['jquery', 'table', 'larryms', 'common'], function(exports) {
	var $ = layui.$,
		table = layui.table,
		common = layui.common,
		larryms = layui.larryms;
	//时间戳的处理
	layui.laytpl.toDateString = function(d, format) {
		var date = new Date(d || new Date()),
			ymd = [
				this.digit(date.getFullYear(), 4), this.digit(date.getMonth() + 1), this.digit(date.getDate())
			],
			hms = [
				this.digit(date.getHours()), this.digit(date.getMinutes()), this.digit(date.getSeconds())
			];

		format = format || 'yyyy-MM-dd HH:mm:ss';

		return format.replace(/yyyy/g, ymd[0])
			.replace(/MM/g, ymd[1])
			.replace(/dd/g, ymd[2])
			.replace(/HH/g, hms[0])
			.replace(/mm/g, hms[1])
			.replace(/ss/g, hms[2]);
	};

	//数字前置补零
	layui.laytpl.digit = function(num, length, end) {
		var str = '';
		num = String(num);
		length = length || 2;
		for (var i = num.length; i < length; i++) {
			str += '0';
		}
		return num < Math.pow(10, length) ? str + (num | 0) : num;
	};

	if (layui.cache.identified == 'articlelist') {
		//搜索【此功能需要后台配合，所以暂时没有动态效果演示】
		$("#searchBtn").on("click", function() {
			if ($(".searchVal").val() != '') {
				table.reload("article", {
					page: {
						curr: 1 //重新从第 1 页开始
					},
					where: {
						key: $(".searchVal").val() //搜索的关键字
					}
				})
			} else {
				larryms.msg("请输入搜索的内容");
			}
		});
		var mUrl = $('#article').data('url'),
			mIns = table.render({
				elem: '#article',
				id: "article",
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
						minWidth: 360,
						align: 'left'
					}, {
						field: 'pubdate',
						title: '审核/发布时间',
						width: 230,
						align: 'center',
						templet: function(d) {
							return d.audit + '/' + d.pubdate;
						}
					}, {
						field: 'cate',
						title: '栏目类别',
						width: 150,
						align: 'center'
					}, {
						field: 'status',
						title: '权限状态',
						width: 150,
						align: 'center',
						templet: "#articleStatus"
					}, {
						field: 'flag',
						title: '置顶加精',
						width: 150,
						align: 'center',
						templet: function(d) {
							if (d.flag == 1) {
								return '<input type="checkbox" name="flag" lay-filter="flag" lay-skin="switch" lay-text="是|否" checked>';
							} else {
								return '<input type="checkbox" name="flag" lay-filter="flag" lay-skin="switch" lay-text="是|否">';
							}
						}
					}, {
						field: 'click',
						title: '阅读量',
						width: 130,
						align: 'center'
					}, {
						field: 'author',
						title: '发布人',
						width: 130,
						align: 'center'
					}, {
						title: '操作',
						width: 200,
						templet: '#listBar',
						fixed: "right",
						align: "center"
					}]
				]
			});

	}
	//按钮组监听
	$('#articleBtn .layui-btn').on('click', function() {
		var type = $(this).data('type'),
			url = $(this).data('url'),
			tit = $(this).children('cite').text();
		if (type == 'add') {
			var data = {
				href: $(this).data('url'),
				id: $(this).data('id'),
				font: 'larry-icon',
				icon: $(this).data('icon'),
				group: $(this).data('group'),
				title: '文章发布',
				addType: 'iframe'
			};
			active[type].call(this, data);
		} else {
			active[type] ? active[type].call(this, url, tit) : '';
		}

	});
	var active = {
		add: function(data) {

			common.tab.addTab(data, 'iframe');
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
							// if (res.code == 200) {
							// 	larryms.msg(res.msg);
							// 	table.reload(tableID, {
							// 		page: {
							// 			curr: 1
							// 		}
							// 	});
							// } else {
							// 	larryms.msg(res.msg);
							// }
							larryms.msg('已执行到删除，实际项目中请填写后端处理url即可');
						});
					});
				}
			} else {
				larryms.msg('请至少选择一项，进行删除操作');
			}
		}
	};
	 var pageTableID = $('.larryms-table-id').attr('id');
	// 监听工具条
	table.on('tool(' + pageTableID + ')', function(obj) {
		var data = obj.data;
		if (obj.event == 'edit') {
			if (layui.cache.identified == 'index') {
				data.aid = data.id;
			}
			var url = $(this).data('url') + '?aid=' + data.aid + '&cid=' + data.cid;

			location.href = url;
		}else if(obj.event == 'del'){
			var url = $(this).data('url');
			larryms.confirm('你确定要删除该条数据吗？', {
				icon: 3,
				title: '删除提示'
			}, function() {
				var ids = {
					"id": data.id
				};
				$.post(url, ids, function(res) {
					// if (res.code == 200) {
					// 	larryms.msg(res.msg);
					// 	table.reload(pageTableID, {});
					// } else {
					// 	larryms.msg(res.msg);
					// }
					larryms.msg('已执行到删除，实际项目中请填写后端处理url即可');
				});
			});
		}else if(obj.event == 'look'){
			larryms.alert('预览操作，可自定义再当前页面或新窗口打开当前选择的文档地址进行预览');
		}
	});
	exports('content', {});
});