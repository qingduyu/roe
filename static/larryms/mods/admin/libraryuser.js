layui.define(['jquery','code'],function(exports){
	var $ = layui.$,
	    code = layui.code;
	layui.code({
		skin: 'notepad',
		about: false,
		elem: ".layui-code",
		encode: true
	});
	layui.code({
		about: false,
		elem: ".larry-code",
		encode: true
	});
	exports('libraryuser',{});
});