layui.define(['jquery', 'larryMenu','util'], function(exports) {
	'use strict';
	var $ = layui.$,
		layer = layui.layer,
		larryms = layui.larryms,
		util = layui.util,
		larryMenu = layui.larryMenu();

	var larrymsElemBox = $('#larry_layout'),
		LarryMenuDatas = [
			[{
				text: "刷新当前页",
				func: function() {
					if (top == self) {
						if (larrymsElemBox.length) {
							larryms.confirm('您确定要重新加载系统吗！', {},function() {
								top.document.location.reload();
							}, function() {
								return;
							});
						} else {
							document.location.reload();
						}
					} else {
						if (layui.cache.layertype !== undefined && layui.cache.layertype == 2) {
							var curIndex = parent.layer.getFrameIndex(window.name),
								$curIframe = $('#layui-layer-iframe' + curIndex),
								curIframeUrl = $curIframe.context.URL;
							parent.layer.iframeSrc(curIndex, curIframeUrl);
						} else {
							$('.layui-tab-content .layui-tab-item', parent.document).each(function() {
								if ($(this).hasClass('layui-show')) {
									$(this).children('iframe').attr('src', $(this).children('iframe').attr('src'));
									return false;
								}
							});
						}
					}
				}
			}, {
				text: "重载主框架",
				func: function() {
					top.document.location.reload();
				}
			}, {
				text: "设置系统主题",
				func: function() {
					if (top.document.getElementById('larryTheme') !== null) {
						top.document.getElementById('larryTheme').click();
					} else {
						larryms.error('当前页面不支持主题设置或请登陆系统后设置系统主题', larryms.tit[0], 2);
					}
				}
			}, {
				text: "选项卡常用操作",
				data: [
					[{
						text: "定位当前选项卡",
						func: function() {
							if (top.document.getElementById('tabCtrD') !== null) {
								top.document.getElementById('tabCtrD').click();
							} else {
								larryms.error('请先登陆系统，此处无选项卡操作', larryms.tit[0]);
							}
						}
					}, {
						text: "关闭当前选项卡",
						func: function() {
							if (top.document.getElementById('tabCtrA') !== null) {
								top.document.getElementById('tabCtrA').click();
							} else {
								larryms.error('请先登陆系统，此处无选项卡操作', larryms.tit[0], 2);
							}
						}
					}, {
						text: "关闭其他选项卡",
						func: function() {
							if (top.document.getElementById('tabCtrB') !== null) {
								top.document.getElementById('tabCtrB').click();
							} else {
								larryms.error('请先登陆系统，此处无选项卡操作', larryms.tit[0], 2);
							}
						}
					}, {
						text: "关闭全部选项卡",
						func: function() {
							if (top.document.getElementById('tabCtrC') !== null) {
								top.document.getElementById('tabCtrC').click();
							} else {
								larryms.error('请先登陆系统，此处无选项卡操作', larryms.tit[0], 2);
							}
						}
					}]
				]
			}, {
				text: "清除缓存",
				func: function() {
					top.document.getElementById('clearCached').click();
				}
			}],
			[{
				text: "访问github地址",
				func: function() {
					top.window.open('https://github.com/qingduyu/roe');
				}
			}]
		];
	var Core = new Function();
	Core.prototype.tab = {
		addTab: function(data, type) {
			if (window.top == window.self) {
				if (type == 'page') {
					larryTab.tabAdd(data);
				}
			} else {
				if (type == 'iframe') {
					top.larryTab.tabAdd(data);
				}
			}
		},
		// 页面右键菜单
		rightMenu: function(larryMenuData) {
			larryMenu.ContentMenu(larryMenuData, {
				name: 'body'
			}, $('body'));
			if (window.top === window.self) {
				var $larrymsTabCon = $('#larry_tab_content');
				if ($larrymsTabCon.length !== 0) {
					$larrymsTabCon.mouseenter(function() {
						larryMenu.remove();
					});
				}
			} else {
				if (layui.cache.layertype !== undefined && layui.cache.layertype == 2) {
					$('iframe', parent.document).mouseout(function() {
						larryMenu.remove();
					});
				}
				var $larymsIframe = $('#larry_tab_content', window.parent.document);

				$larymsIframe.mouseout(function() {
					larryMenu.remove();
				});
			}
		}
	};
	Core.prototype.init = function() {
		var that = this;
		$('[larry-tab]').on('click', function() {
			var valType = $(this).attr('larry-tab');
			if (valType !== undefined && valType !== '') {
				var gp;
				if ($(this).data('group') !== undefined) {
					gp = $(this).data('group');
				} else {
					gp = 'larry-temp';
				}
				if (valType == 'page') {
					// 主框架页面中添加页面到选项卡
					var data = {
						href: $(this).data('url'),
						id: $(this).data('id'),
						font: $(this).children('i').data('font'),
						icon: $(this).children('i').data('icon'),
						group: gp,
						title: $(this).children('cite').text(),
						addType: 'page'
					};
					that.tab.addTab(data, 'page');
				} else if (valType == 'iframe') {
					var data = {
						href: $(this).data('url'),
						id: $(this).data('id'),
						font: $(this).data('font'),
						icon: $(this).data('icon'),
						group: gp,
						title: $(this).find('cite').text(),
						addType: 'iframe'
					};
					that.tab.addTab(data, 'iframe');
				} else {
					larryms.error('请检查页面中含有larry-tab属性的元素，未正确设置参数格式：目前仅支持：page|iframe两种类别', larryms.tit[1], 2);
				}
			} else {
				larryms.error('请检查页面中含有larry-tab属性的元素，未设置任何值：目前仅支持：page|iframe两种类别', larryms.tit[1], 2);
			}
		});
		//常用右键菜单功能
		if (layui.cache.rightMenu !== false && layui.cache.rightMenu !== 'custom') {
			that.tab.rightMenu(LarryMenuDatas);
		} else if (layui.cache.rightMenu === false) {
			larryMenu.remove();
			larryMenu = null;
			$(document).bind("contextmenu", function(e) {
				return false;
			});
		} else if (layui.cache.rightMenu === 'none') {
			larryMenu.remove();
			larryMenu = null;
		}
	};
	if (window.top !== window.self) {
		if (!layui.cache.layertype) {
			larryms.utils.fixbar({
				bar1: true,
				bgcolor: '#009688',
				custom: 'larry-tab="iframe" data-group="0" data-id="2" fresh="1" data-url="console.html"'
			});
		}
		util.fixbar();

	}
	$('*[lay-tips]').on('mouseenter', function() {
		var content = $(this).attr('lay-tips');
		this.index = layer.tips('<div style="padding: 10px; font-size: 14px; color: #eee;">' + content + '</div>', this, {
			time: -1,
			maxWidth: 280,
			tips: [1, '#000']
		});
	}).on('mouseleave', function() {
		layer.close(this.index);
	});
	var larryCore = new Core();
	larryCore.init();
	exports('common', larryCore);
});