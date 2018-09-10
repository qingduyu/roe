layui.define(['jquery'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms;
	//不同的页面执行不同的js
	if (layui.cache.identified == 'fonts') {
		larryms.plugin('clipboard.min.js', function() {
			larryFont();
		}); //实际项目中可以直接通过layui.use('clipboard')进行组件库的引用，这里是为展示不同的使用方法
		function larryFont() {
			$('.icon_lists').find('li').each(function(k, v) {
				$(v).attr('data-clipboard-text', $(v).children('.fontclass').text());
			});
			var btns = document.querySelectorAll('li');
			var clipboard = new Clipboard(btns);
			clipboard.on('success', function(e) {
				larryms.message('已成功复制' + e.text+'到剪贴板', 'success');
			});
		}
		$('#nums').text($('.icon_lists').find('li').length);
		$("#search_text").focus();
		$("#search_icon").click(function() {
			var txt = $("#search_text").val();
			if ($.trim(txt) != "" && $.trim(txt) != "larry") {
				$(".icon_lists li").hide().filter(":contains('" + txt + "')").show();
			} else {
				larryms.message('请输入点什么再搜索吧(全部图标均含有larry字符)！', 'error','larry-cuowu3', 1500);
				$(".icon_lists li").show();
			}
		});
		$("#search_text").keydown(function() {
			if (event.keyCode == "13") {
				var txt = $("#search_text").val();
				if ($.trim(txt) != ""  && $.trim(txt) != "larry") {
					$(".icon_lists li").hide().filter(":contains('" + txt + "')").show();
				} else {
					larryms.message('请输入点什么再搜索吧(全部图标均含有larry字符)！', 'error');
					$(".icon_lists li").show();
				}
			}
		});
	} else if (layui.cache.identified == 'fonts') {

	}
	exports('library', {});
});