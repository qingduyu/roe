layui.define(['form', 'laytpl', 'table'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms,
		laytpl = layui.laytpl,
		form = layui.form;
	table = layui.table;
	var addIndex;
	var fontpath = layui.cache.base + 'lib/fonts/';
	var pageTableID = $('.larryms-table-id').attr('id');
	var curIfr = parent.layer.getFrameIndex(window.name);

	var dataUrl = $('#menulist').data('url');
	menuTable = table.render({
		elem: '#menulist',
		id: 'menulist',
		url: dataUrl,
		cellMinWidth: 80,
		method: 'post',
		height: "full-210",
		cols: [
			[{
				type: "checkbox",
				fixed: 'left',
				width: 50
			}, {
				field: 'title',
				title: '菜单名称',
				width: 200
			}, {
				field: 'authtype',
				title: '菜单类型',
				width: 100,
				align: 'center'
			}, {
				field: 'icon',
				title: '菜单图标',
				width: 90,
				align: 'center',
				templet: function(d) {
					return "'<i class='" + d.font + ' ' + d.icon + "'></i>'";
				}
			}, {
				field: 'name',
				title: '权限规则',
				minWidth: 230
			}, {
				field: 'param',
				title: '附加参数',
				templet: function(d) {
					return d.param !== "" ? d.param : "无";
				},
				align: 'center',
				width: 90
			}, {
				field: 'condition',
				title: '附加规则',
				align: 'center',
				templet: function(d) {
					return d.condition !== "" ? d.condition : "无";
				},
				width: 90
			}, {
				field: 'sort',
				title: '菜单排序',
				width: 90,
				align: 'center'
			}, {
				field: 'status',
				title: '状态',
				templet: '#statusBar',
				width: 100,
				align: 'center'
			}, {
				field: 'remark',
				title: '备注',
				minWidth: 200,
				align: 'center'
			}, {
				title: '操作',
				width: 160,
				templet: '#menuBar',
				fixed: "right",
				align: "center"
			}]
		]
	});


	var menusHtml = laytpl($('#menuAddTpl').html()).render({
		SELECTID: 'larrymsAdd',
		LARRYFILTER: 'larryMenuAdd',
		MENUICON: 'larryICON',
		MENUICONI: 'larryIconFont',
		MENUICONINPUT: 'larryIconInput',
		FONTA: 'larry_icon',
		FONTB: 'fa_awe',
		MENUICONFONT: 'larryFont',
		RESTID: 'resetAdd'
	});
	//按钮组监听
	$('.larryms-btn-group .layui-btn').on('click', function() {
		var type = $(this).data('type'),
			url = $(this).data('url'),
			tit = $(this).children('cite').text();
		if (type == 'add') {
			addIndex = menus.add(menusHtml, tit, fontpath);
		} else {
			menus[type] ? menus[type].call(this) : '';
		}
	});

	var menus = {
		add: function(data, tit, fontpath) {
			return menuAdd = larryms.open({
				type: 1,
				skin: 'larryms-navy',
				title: tit,
				area: '700px',
				shadeClose: true,
				shade: 0.2,
				offset: '20px',
				maxmin: true,
				content: data,
				btnAlign: 'c',
				success: function(layero, index) {
					form.render();
					$('#larryICON').off('click').on('click', function() {
						getLarryFont(fontpath);
						$('.larry-icon-box').slideToggle('normal', function() {
							$(this).addClass('on');
						});
					});
					$('#larryIconInput').on('focus', function() {
						layer.tips('可以点击左侧图标进行选择',
							$("#larryICON"), {
								tips: [1, '#FF5722'],
							}
						);
						if ($('.larry-icon-box').hasClass('on')) {
							$('.larry-icon-box').hide();
						}
					});
				},
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
								larryms.msg(res.msg);
							}
						});
					});
				}
			} else {
				larryms.msg('请至少选择一项，进行删除操作');
			}
		}
	};

	function getLarryFont(fontpath) {
		$('#larry_icon').load(fontpath + 'larry-icon.html', function() {
			var $li = $('#larry_icon ul.icon_lists li');
			$li.off('click').on('click', function() {
				var icon = $(this).children('i').attr('class'),
					iconArr = icon.split(' ');
				$('#larryIconFont').removeClass().addClass(icon);
				$('#larryIconInput').val(iconArr[2]);
				$('#larryFont').val(iconArr[1]);
				$('#larrymsAdd .larry-icon-box').hide();
			});
			$("#larrymsAdd .search_icon").click(function() {
				var txt = $("#larrymsAdd .search_text").val();
				if ($.trim(txt) != "") {
					$("#larrymsAdd .icon_lists li").hide().filter(":contains('" + txt + "')").show();
				} else {
					larryms.message('请输入点什么再搜索吧！', 'error', 1500);
					$("#larrymsAdd .icon_lists li").show();
				}
			});
			$("#larrymsAdd .search_text").keydown(function() {
				if (event.keyCode == "13") {
					var txt = $("#larrymsAdd .search_text").val();
					if ($.trim(txt) != "") {
						$("#larrymsAdd .icon_lists li").hide().filter(":contains('" + txt + "')").show();
					} else {
						larryms.message('请输入点什么再搜索吧！', 'error', 1500);
						$("#larrymsAdd .icon_lists li").show();
					}
				}
			});
		});
	}

	form.on('radio(menu)', function(data) {
		if (data.value !== '1') {
			$('#larrymsAdd #name').attr('lay-verify', 'require');
			$('#larrymsAdd #param').show();
			$('#larrymsAdd #condition').show();
			$('#larrymsAdd #spread').hide();
		} else {
			$('#larrymsAdd #name').removeAttr('lay-verify');
			$('#larrymsAdd #param').hide();
			$('#larrymsAdd #condition').hide();
			$('#larrymsAdd #spread').show();
		}
	});
	$('#resetAdd').on('click', function() {
		console.log('test');
		$('#larrymsAdd')[0].reset();
	});
	$('#larrymsAdd #closeAdd').on('click', function() {
		parent.layer.close(addIndex);
	});


	form.on("submit(menuadd)", function(data) {

		$.post(data.form.action, data.field, function(res) {
			if (res.code == 200) {
				if (layui.cache.identified == 'menuedit') {
					larryms.msg(res.msg);
					parent.table.reload('menulist', {});
					parent.layer.close(curIfr);
				} else {
					//局部刷新未写
					larryms.msg(res.msg);
					layer.close(addIndex);
					table.reload('menulist', {});
				}

			} else if (res.code == 911) {
				larryms.msg(res.msg);
			} else if (res.code == 500) {
				larryms.msg(res.msg);
			}
		});
	});


	// 监听工具条
	table.on('tool(' + pageTableID + ')', function(obj) {
		var data = obj.data,
			tit = '编辑 <em class="tit">' + data.title + '</em> 菜单';

		if (obj.event == 'edit') {
			var url = $(this).data('url') + '?id=' + data.id;

			var editIndex = larryms.open({
				type: 2,
				skin: 'larryms-navy',
				title: tit,
				area: ['720px', '666px'],
				shadeClose: true,
				shade: 0.2,
				offset: '30px',
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
	if (layui.cache.identified == 'menuedit') {
		$('#larryICONEdit').off('click').on('click', function() {
			getLarryFont(fontpath);
			$('.larry-icon-box').slideToggle('normal', function() {
				$(this).addClass('on');
			});
		});
		$('#larryIconInput').on('focus', function() {
			layer.tips('可以点击左侧图标进行选择',
				$("#larryICON"), {
					tips: [1, '#FF5722'],
				}
			);
			if ($('.larry-icon-box').hasClass('on')) {
				$('.larry-icon-box').hide();
			}
		});

		form.on('switch(switchSpread)', function(data) {
			if (!data.elem.checked) {
				$(this).val('1');
			} else {
				$(this).val('0');
			}
			return false;
		})
	}
	exports('menus', {});
});