layui.extend({larryms:"lib/larryms"}).define(["jquery","configure","layer","larryms"],function(e){
    "use strict";
    var o=layui.$,s=layui.configure,d=layui.layer,u=layui.device(),r=o(window),c=layui.larryms;
    var i=new Function;
    var a={larryms:"lib/larryms",larryTab:"lib/larryTab",larryElem:"lib/larryElem",larryMenu:"lib/larryMenu",larryajax:"lib/larryajax",larryEditor:"lib/larryEditor",larryApi:"lib/larryApi",larryTree:"lib/larryTree",larrySecret:"lib/larrySecret",echarts:"lib/extend/echarts",echartStyle:"lib/extend/echartStyle",md5:"lib/extend/md5",base64:"lib/extend/base64",fullPage:"lib/extend/fullPage",geetest:"lib/extend/geetest",classie:"lib/extend/classie",snapsvg:"lib/extend/svg/snapsvg",svgLoader:"lib/extend/svg/svgLoader",clipboard:"lib/extend/clipboard",swiper:"lib/extend/swiper/swiper",ckplayer:"lib/extend/ckplayer/ckplayer",countup:"lib/extend/countup",qrcode:"lib/extend/qrcode",videojs:"lib/extend/video/videojs",flash:"lib/extend/video/flash",EvEmitter:"lib/extend/EvEmitter",imagesloaded:"lib/extend/imagesloaded",jqui:"lib/extend/jqueryui/jqui",bigvideo:"lib/extend/video/bigvideo",ztree:"lib/extend/ztree/ztree",ztreeCheck:"lib/extend/ztree/ztreeCheck",ueconfig:"lib/extend/ueditor/ueconfig",ueditor:"lib/extend/ueditor/ueditor",neconfig:"lib/extend/neditor/neconfig",neditor:"lib/extend/neditor/neditor"};
    function y(){
        var e=r.width();
        if(e>=1200){
            return 3
        }
        else if(e>=992){return 2}else if(e>=768){return 1}else{return 0}}
        window.larrymsExtend=true;
    layui.cache.extendStyle=s.basePath+"lib/extendStyle/";
    var b=s.modules+s.modsname;i.prototype.modules=function(){
        for(var e in a){
            layui.modules[e]=a[e]}}();
    i.prototype.init=function(){
        var e=this;c.debug=s.debug;if(s.browserCheck){
            if(u.ie&&u.ie<8){
                d.alert("本系统最低支持ie8，您当前使用的是古老的 IE"+u.ie+" \n 建议使用IE9及以上版本的现代浏览器",{title:c.tit[0],skin:"larry-debug",icon:2,resize:false,zIndex:d.zIndex,anim:Math.ceil(Math.random()*6)})}}c.screen=y();
        if(s.fontSet){
            c.fontset({font:s.font,url:s.fontUrl,online:s.fontSet})}if(window.top===window.self){
                    }
                    if(layui.cache.page){layui.cache.page=layui.cache.page.split(",");
                    if(o.inArray("larry",layui.cache.page)===-1){var r={};
                    for(var i=0;i<layui.cache.page.length;i++)
                    {r[layui.cache.page[i]]=b+layui.cache.page[i]}
                    layui.extend(r);layui.use(layui.cache.page)}}if(s.basecore!=="undefined"){
            var a=s.basecore.split(",");var l={};for(var i=0;i<a.length;i++){l[a[i]]=s.modules+a[i]}layui.extend(l);layui.use(s.basecore)}if(s.modscore){if(layui.cache.modscore==false){return false}var t=s.corename.split(",");var n={};for(var i=0;i<t.length;i++){n[t[i]]=b+t[i]}layui.extend(n);layui.use(s.corename)}if(s.animations){layui.link(s.basePath+"lib/extendStyle/animatelib/animations.css")}}();
    window.onresize=function(){c.screen=y()};e("larry",{})});