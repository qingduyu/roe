layui.define(['jquery','bigvideo', 'jqui', 'larryms','form','larryMenu'], function(exports) {
	var $ = layui.$,
		larry = layui.larry,
		larryms = layui.larryms,
		bigvideo = layui.bigvideo,
		jqui = layui.jqui,
		form = layui.form,
		larryMenu = layui.larryMenu();

	var BV = new $.BigVideo({
		container: $('body'),
		doLoop: true
	});
	BV.init();
	BV.show(layui.cache.video);

	$("input.larry-input[type='text'],input.larry-input[type='password']").keyup(function() {
		var Len = $(this).val().length;
		if (!$(this).val() == '') {
			if ($(this).attr('name') !== 'code' && Len >= 5) {
				$(this).next().animate({
					'opacity': '1'
				}, 200);
			} else if ($(this).attr('name') === 'code' && Len >= 6) {
				$(this).next().animate({
					'opacity': '1'
				}, 200);
			}
		} else {
			$(this).next().animate({
				'opacity': '0'
			}, 200);
		}
	});
	var fullscreen = function() {
		elem = document.body;
		if (elem.webkitRequestFullScreen) {
			elem.webkitRequestFullScreen();
		} else if (elem.mozRequestFullScreen) {
			elem.mozRequestFullScreen();
		} else if (elem.requestFullScreen) {
			elem.requestFullscreen();
		} else {
			//浏览器不支持全屏API或已被禁用  
		}
	}
	$('#captchaImg').on('click',function(){
         $(this).attr('src',layui.cache.captcha+"?time="+Math.random());
    	});
	// 登录认证
	form.on('submit(larryforum)',function(data){
        if(!true){
             //验证码等基础验证通过之后
        }else{
        	// 完成基础准备，转入登录在线验证
            fullscreen();
            $('.login').addClass('dip'); //倾斜特效
            setTimeout(function () {
	            $('.login').addClass('dip-tran'); //平移特效
	        }, 300);
	        setTimeout(function () {
	                    $('.authent').show().animate({ right: -320 }, {
	                        easing: 'easeOutQuint',
	                        duration: 600,
	                        queue: false
	                    });
	                    $('.authent').animate({ opacity: 1 }, {
	                        duration: 200,
	                        queue: false
	                    }).addClass('visible');
	                }, 500);

	        // 提交验证
        }
        return false;
	});
    
    var LarryMD = [
        [{
            text: "刷新",
            func: function() {
                top.document.location.reload();
            }
        }, {
            text: "全屏",
            func: function() {
               larryms.fullScreen.entry();
            }
        }, {
            text: "退出全屏",
            func: function() {
                larryms.fullScreen.exit();
            }
        }],
        [{
            text: "larryMS官网",
            func: function() {
                top.window.open('http://www.larryms.com');
            }
        },{
            text: "larryMS社区",
            func: function() {
                top.window.open('http://www.larryms.com/forum');
            }
        }]
    ];
	// 登录页右键
	larryMenu.ContentMenu(LarryMD, {
                name: 'body'
    }, $('body'));
	exports('login', {});
});