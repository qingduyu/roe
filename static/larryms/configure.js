layui.define(function(exports){
	exports('configure',{
		basePath:layui.cache.base || '/larryms/',//保存静态资源文件路径，建议页面中填写，生产环境中使用绝对路径
		modules:layui.cache.entry!==undefined ? layui.cache.entry : 'mods/',//此处 modules可根据项目需要自定义存放项目js文件总路径:即 后台/前台；若不需要规范文件路径或其他原因请设置为false;
		basecore:'undefined',//用户自定义全局公共核心模块文件（默认为未设置，可作为larryms的扩充）
		modsname: layui.cache.mods !== undefined ? layui.cache.mods : 'admin/',//项目模块存放目录名
		modscore: true,//项目公共模块默认开启，如需关闭请设置modscore:false
		corename:'common',//用户项目各公共模块：举例 如mods/admin/common.js、mods/index/common.js; 默认开启，用户可自定义名称，关闭可设置corename：false
		debug:true,//是否开启调试模式
		browserCheck:true,//是否开启浏览器版本兼容检测
		fontSet:true,//是否使用larryms在线图标库，设置为false时需要手动在页面中引入字体库样式文件
		font:'larry-icon',//默认主字体库使用larry-icon
		fontUrl:'//at.alicdn.com/t/font_477590_k9hqhxos6x.css',//可以根据需要使用自定义路径但不建议在此修改，可根据文档在项目公共模块中设置自定义字体库url
		theme:false,//开启主题自定义设置
		thirdExtend:true,//开启用户自定义扩展组件目录 false时关闭
		thirdDir: 'thirdlib/',//用户自定义扩展组件目录，thirdlib为用户自定义目录名称（可以任意修改名称但路径需要在larryms目录下）
		//主框架相关主题初始化参数
		topMenuSet:true,//开启顶部导航菜单，建议使用顶部导航菜单
		tabSession:true,//默认开启选项卡缓存记忆功能
		tabRefresh:true,//tab选项卡切换与导航重新点击是否刷新子页面默认关闭
		animations:false,//页面默认加载切换动画效果,直接影响全局动画效果，优先级高于主题设置
	});
});