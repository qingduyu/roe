/**
 * @name 后台页面示例
 */
layui.define(['jquery','larry'],function(exports){
  "use strict";
	var $ = layui.$,
	    larry = layui.larry,
	    larryms = layui.larryms;
	
	larryms.plugin('clipboard.min.js',function(){
		 larryFont();
	});
    
	function larryFont(){
		$('.icon_lists').find('li').each(function(k, v) {
			$(v).attr('data-clipboard-text', $(v).children('.fontclass').text());
		});
		var btns = document.querySelectorAll('li');
		var clipboard = new Clipboard(btns);
        clipboard.on('success', function(e) {
			larryms.message('已成功复制' + e.text, 'success', 1500);
		});
	} 
	$('#nums').text($('.icon_lists').find('li').length);
	$("#search_text").focus();
	$("#search_icon").click(function() {
		var txt = $("#search_text").val();
		if ($.trim(txt) != "") {
			$(".icon_lists li").hide().filter(":contains('" + txt + "')").show();
		} else {
			larryms.message('请输入点什么再搜索吧！', 'error', 1500);
			$(".icon_lists li").show();
		}
	});
	$("#search_text").keydown(function() {
		if (event.keyCode == "13") {
			var txt = $("#search_text").val();
			if ($.trim(txt) != "") {
				$(".icon_lists li").hide().filter(":contains('" + txt + "')").show();
			} else {
				larryms.message('请输入点什么再搜索吧！', 'error', 1500);
				$(".icon_lists li").show();
			}
		}
	});

	// animate
	if (layui.cache.identify && layui.cache.identify == 'animate') {
		larryms.plugin('jquery-migrate.min.js', function() {
			$(function() {
				if ($.browser.msie && $.browser.version < 10) {
					$('.jq22-explain').show();
				}
				var $animate = $('#animate');
				var $btn = $('.tabCnt').find('li');
				$btn.click(function() {
					$(this).addClass('active').siblings().removeClass('active');
					$animate.removeClass().addClass($(this).text() + ' animated infinite');
					setTimeout(removeClass, 1000);
				});
				function removeClass() {
					$animate.removeClass();
				}
				var $tabNavItem = $('.tabNav').find('a');
				var $tabPane = $('.tabPane');
				$tabNavItem.each(function(i) {
					$(this).click(function() {
						$(this).parent().addClass('active').siblings().removeClass('active');
						$tabPane.eq(i).addClass('active').siblings().removeClass('active');
						return false;
					});
				});
			});
		});
	}
    exports('demo', {}); 
});