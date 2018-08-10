/**
 * @name 后台登录模块
 */
layui.define(['larry','form','larryms'],function(exports){
	"use strict";
	var $ = layui.$,
            layer = layui.layer,
            larryms = layui.larryms,
            form = layui.form;
    // larryms.success('用户名：larry 密码：larry 无须输入验证码，输入正确后直接登录后台!','larryMS后台帐号登录提示',20);
    
    function supersized() {
        $.supersized({
            // 功能
            slide_interval: 3000,
            transition: 1,
            transition_speed: 1000,
            performance: 1,
            // 大小和位置
            min_width: 0,
            min_height: 0,
            vertical_center: 1,
            horizontal_center: 1,
            fit_always: 0,
            fit_portrait: 1,
            fit_landscape: 0,
            // 组件
            slide_links: 'blank',
            slides: [{
                image: '../backstage/images/login/1.jpg'
            }, {
                image: '../backstage/images/login/2.jpg'
            }, {
                image: '../backstage/images/login/3.jpg'
            }]
        });
    }
    larryms.plugin('jquery.supersized.min.js',supersized); 
    //模拟登录(2.08会重写构建前后端分离验证模块)
    form.on('submit(submit)', function(data) {
        if (data.field.uname == 'larry' && data.field.password == 'larry') {
            layer.msg('登录成功', {
                icon: 1,
                time: 1000
            });
            setTimeout(function() {
                window.location.href = 'index.html';
            }, 1000);

        } else {
            layer.tips('用户名:larry 密码：larry 无需输入验证码', $('#password'), {
                tips: [3, '#FF5722']
            });
        }
        return false;
    });
    exports('login', {}); 
});