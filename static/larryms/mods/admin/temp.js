layui.define(['jquery', 'larryms', 'classie', 'svgLoader', 'code'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms,
		classie = layui.classie,
		svgLoader = layui.svgLoader;
	// 执行svg插件引入（也可以通过组件方式引入svg组件）
	// larryms.plugin('snap.svg-min');
	var loader = new SVGLoader(document.getElementById('loader'), {
		speedIn: 400,
		easingIn: mina.easeinout
	});
	if (layui.cache.identified == 'one') {
		function init() {
			$('.larryms-svg-box').removeClass('show');
			loader.show();
			setTimeout(function() {
				loader.hide();
				$('.larryms-svg-box').addClass('show');
			}, 1000);
		}
	} else if(layui.cache.identified == 'fonts'){
		function init() {
			$('.larryms-fonts-box').removeClass('show');
			loader.show();
			setTimeout(function() {
				loader.hide();
				$('.larryms-fonts-box').addClass('show');
			}, 800);
		}
	}else if(layui.cache.identified == 'two'){
		function init() {
			$('.larryms-svg-box').removeClass('show');
			loader.show();
			setTimeout(function() {
				loader.hide();
				$('.larryms-svg-box').addClass('show');
			}, 2000);
		}
	}else{
		function init() {
			$('.larryms-svg-box').removeClass('show');
			loader.show();
			setTimeout(function() {
				loader.hide();
				$('.larryms-svg-box').addClass('show');
			}, 800);
		}
	}
	init();
	layui.code({
		skin: 'notepad',
		title: '使用示例',
		about: false
	});
	exports('temp', {});
});