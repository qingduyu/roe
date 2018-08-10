/**
 * @name 管理员信息
 */
layui.define(['larry','form','upload'],function(exports){
	"use strict";
	var $ = layui.$,
	    larry = layui.larry,
	    form = layui.form,
	    upload = layui.upload;

     var uploadInst = upload.render({
     	 elem:'#larry_photo',
     	 url:'/upload/',
     	 done:function(res){

     	 },
     	 error:function(){

     	 }
     })
    var active = {

    };

    exports('mypanel', {}); 
});