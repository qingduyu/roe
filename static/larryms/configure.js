layui.define(function(exports){
	exports('configure',{
		basePath:layui.cache.base || '/static/larryms/',//保存静态资源文件路径，建议页面中填写，生产环境中使用绝对路径
		modules:layui.cache.entry!==undefined ? layui.cache.entry : 'mods/',//此处 modules可根据项目需要自定义存放项目js文件总路径:即 后台/前台；若不需要规范文件路径或其他原因请设置为false;
		basecore:'undefined',//用户自定义全局公共核心模块文件（默认为未设置，可作为larryms的扩充）
		modsname: layui.cache.mods !== undefined ? layui.cache.mods : 'admin/',//项目模块存放目录名
		modscore: true,//项目公共模块默认开启，如需关闭请设置modscore:false
		corename:'common',//用户项目各公共模块：举例 如mods/admin/common.js、mods/index/common.js; 默认开启，用户可自定义名称，关闭可设置corename：false
		debug:true,//是否开启调试模式
		browserCheck:true,//是否开启浏览器版本兼容检测
		fontSet:true,//是否使用larryms在线图标库，设置为false时需要手动在页面中引入字体库样式文件
		font:'larry-icon',//默认主字体库使用larry-icon
		fontUrl:'//at.alicdn.com/t/font_477590_rynrlavilcj.css',//可以根据需要使用自定义路径但不建议在此修改，可根据文档在项目公共模块中设置自定义字体库url
		animations:true,//页面默认加载切换动画效果
		theme:true,//开启主题自定义设置
		grantUser:'qingduyu',
 grantKey:'p8End1ZcuudngqiyAYcTNLjC'
	});
});