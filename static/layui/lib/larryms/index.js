/**
 * @name 后台主框架
 */
layui.define(['jquery','form','larryTab','laytpl','larry'],function(exports){
    var $ = layui.$,
        form = layui.form,
        larryTab = layui.larryTab({
        	tab_elem:'#larry_tab',
            tabMax:30
        }),
        layer = layui.layer,
        laytpl = layui.laytpl,
        larry = layui.larry,
        larryms = layui.larryms,
        $win = $(window),
        $body = $('body');

    //系统锁屏控制
    var locks = layui.data('larryms').lockscreen;
    if(locks === 'locked'){
        //锁屏
        lockSys();
    }
    //菜单初始化
    larryTab.menuSet({
        type:'POST',
        url:layui.cache.menusUrl,
        left_menu:'#larryms_left_menu',
        leftFilter:'LarrySide'
    });
    larryTab.menu();
    
    if(larryTab.config.tabSession){
        larryTab.session(function(session){
             if(session.getItem('tabMenu')){
                 $('#larry_tab_title li.layui-this').trigger('click');
             }
        });
    }
    
    //主页框架
    $('#larryms_version').text(larryms.version);
    // 菜单折叠
    $('#menufold').on('click',function(){
         if($('#larry_layout').hasClass('larryms-fold')){
             $('#larry_layout').addClass('larryms-unfold').removeClass('larryms-fold');
             $(this).children('i').addClass('larry-fold7').removeClass('larry-unfold');
         }else{
             $('#larry_layout').addClass('larryms-fold').removeClass('larryms-unfold');
             $(this).children('i').addClass('larry-unfold').removeClass('larry-fold7');
         }
    });
    // 主题设置
    $('#larryTheme').on('click',function(){
          var index = layer.open({
          	   type:1,
          	   id:'larry_theme_R',
          	   title:false,
          	   anim: Math.ceil(Math.random() * 6),
          	   offset: 'r',
          	   closeBtn:false,
          	   shade:0.2,
          	   shadeClose: true,
          	   skin:'layui-anim layui-anim-rl larryms-layer-right',
          	   area: '320px',
          	   success:function(layero, index){
                   var styles = layui.cache.base+'templets/style/theme.css';
                   layui.link(styles);
                   larryms.htmlRender('templets/theme',layero);
          	   },
          });
    });
    //清除缓存
    $('#clearCached').off('click').on('click',function(){
            larryms.cleanCached('larry_menu');
            layer.alert('缓存清除完成!本地存储数据也清理成功！', 
                { icon: 1, 
                  title: '系统提示',
                  end:function(){
                     top.location.reload();//刷新
                }}
            );
    });
    // 退出系统
    $('#logout').off('click').on('click',function(){
          var url = $(this).data('url');
          larryms.logOut(url);
    });
    
    $('#lock').mouseover(function(){
        layer.tips('请按Alt+L快速锁屏！',$(this),{
            tips: [1, '#FF5722'],
            time: 1500
        });
    });
    $('#lock').off('click').on('click',function(){
        lockSys();
    });
    
    //锁屏
    function lockSys(){
        var img = $('#user_photo').attr('src'),
            name = $('#uname').text();
        locksInterface({
            Display: 'block',
            UserPhoto: img,
            UserName: name
        });
        // 设置锁屏状态存入本地 或后台数据库状态 根据实际需要选择
        //1、仅本地锁屏解锁
            layui.data('larryms',{
                 key: 'lockscreen',
                 value:'locked'
            });
        //2、连接数据库
           // 在larryMS2.08完整版中体现
        startTimer();
    }
    //解锁
    function unlockSys(){
      //验证锁屏密码
       var img = $('#user_photo').attr('src'),
            name = $('#uname').text();
        if($('#unlock_pass').val() === 'larry'){
            
            locksInterface({
                Display: 'none',
                UserPhoto: img,
                UserName: name
            });
            
        }else{
            layer.tips('模拟锁屏，输入密码：larry 解锁', $('#unlock'), {
                tips: [2, '#FF5722'],
                time:1000
            });
           return;
        }
        
    }
    
    // 键盘按键监听
    $(document).keydown(function(){
        return key(arguments[0]);
    });
    function key(e){
       var keynum;
       if(window.event){
          keynum = e.keyCode;
       }else if(e.which){
          keynum = e.which;
       }
       if(e.altKey && keynum == 76){
            lockSys();
       }
    }
   
    // 锁屏界面
    function locksInterface(options){
      var  id= 'larry_lock_screen',
           lockScreen = document.createElement('div'),
           interface = laytpl([
              '<div class="lock-screen" style="display: {{d.Display}};">',
               '<div class="lock-wrapper" id="lock-screen">',
                  '<div id="time"></div>',
                  '<div class="lock-box">',
                    '<img src="{{d.UserPhoto}}" alt="">',
                    '<h1>{{d.UserName}}</h1>',
                    '<form action="" class="layui-form lock-form">',
                        '<div class="layui-form-item">',
                            '<input type="password" id="unlock_pass" name="lock_password" lay-verify="pass" placeholder="锁屏状态，请输入密码解锁" autocomplete="off" class="layui-input"  autofocus="">',
                        '</div>',
                        '<div class="layui-form-item">',
                            '<span class="layui-btn larry-btn" id="unlock">立即解锁</span>',
                        '</div>',
                    '</form>',
                  '</div>',
                '</div>',
              '</div>'
           ].join('')).render(options),
           lockElem = document.getElementById(id);
           
        //主体框架中加载锁屏界面
        lockScreen.id = id;
        lockScreen.innerHTML = interface;

        lockElem && $body[0].removeChild(lockElem);
        if(options.Display !== 'none'){
            $body[0].appendChild(lockScreen);
        }else{
            $('#larry_lock_screen').empty();
        }
        $('#unlock').off('click').on('click',function(){
            unlockSys();
            layui.data('larryms',{
                 key: 'lockscreen',
                 value:'unlock'
            });
        });
        $('#unlock_pass').keypress(function(e){
            if (window.event && window.event.keyCode == 13) {
                $('#unlock').click();
                return false;
            }
        });
    }

    function startTimer(){
        var today=new Date();
        var h=today.getHours();
        var m=today.getMinutes();
        var s=today.getSeconds();
        m = m < 10 ? '0' + m : m;
        s = s < 10 ? '0' + s : s;
        $('#time').html(h+":"+m+":"+s);
        t=setTimeout(function(){startTimer()},500);
   }
    var MainFrame = function(){
          this.themeColor = {
                default : {
                    topColor:'#1b8fe6',
                    topThis:'#1958A6',
                    topBottom:'#01AAED',
                    leftColor:'#2f3a4f',
                    leftRight:'#258ED8',
                    navThis:'#1492DD',
                    titBottom:'#1E9FFF',
                    footColor:'#245c87',
                    name:'default'
                },
                deepBlue :{
                    topColor:'#1b8fe6',
                    topThis:'#1958A6',
                    topBottom:'#01AAED',
                    leftColor:'#2f3a4f',
                    leftRight:'#258ED8',
                    navThis:'#1492DD',
                    titBottom:'#1E9FFF',
                    footColor:'#245c87',
                    name:'deepBlue'
                },
                green :{
                    topColor:'#2a877b',
                    topThis:'#5FB878',
                    topBottom:'#50A66F',
                    leftColor:'#343742',
                    leftRight:'#50A66F',
                    navThis:'#56a66c',
                    titBottom:'#50A66F',
                    footColor:'#3e4e63',
                    name:'green'
                },
                navy:{
                    topColor:'#2f4056',
                    topThis:'#0d51a9',
                    topBottom:'#01AAED',
                    leftColor:'#393d49',
                    leftRight:'#1E9FFF',
                    navThis:'#1E9FFF',
                    titBottom:'#01AAED',
                    footColor:'#343742',
                    name:'navy'
                },
                orange:{
                    topColor:'#F39C34',
                    topThis:'#CD7013',
                    topBottom:'#FF5722',
                    leftColor:'#1d1f26',
                    leftRight:'#FFB800',
                    navThis:'#df7700',
                    titBottom:'#FFB800',
                    footColor:'#f2f2f2',
                    footFont:'#666',
                    name:'orange'
                }
          };
    }; 
    MainFrame.prototype.theme = function(options){
        var id = 'Larryms_theme_style',
            style = document.createElement('style'),
            local = layui.data('larryms'),
            styleText = laytpl([
                // 框架主题颜色配置
                '.layui-header{background-color:{{d.topColor}} !important;border-bottom:3px solid {{d.topBottom}};}',
                '.larryms-extend{border-left:1px solid {{d.topThis}} }',
                '.larryms-nav-bar{background-color:{{d.topBottom}} !important;}',
                '.larryms-extend .larryms-nav li.larryms-this{background:{{d.topThis}} !important; }',
                '.larryms-extend .larryms-nav li.larryms-nav-item:hover{background:{{d.topThis}} !important; }',
                '.larryms-extend .larryms-nav li.larryms-this:hover{background:{{d.topThis}} }',
                '.larryms-fold .larryms-header .larryms-topbar-left .larryms-switch{border-left:1px solid {{d.topThis}} !important;}',
                '.larryms-extend  ul.layui-nav li.layui-nav-item:hover{background:{{d.topThis}} !important;}',
                '.larryms-topbar-right .layui-nav-bar{background-color: {{d.navThis}} !important;}',
                // 左侧
                '.larryms-nav-tree .larryms-this,',
                '.larryms-nav-tree .larryms-this>a{background-color:{{d.navThis}} !important;}',
                '.larryms-body .larryms-left{border-right:2px solid {{d.leftRight}} !important;}',
                '.layui-bg-black{background-color:{{d.leftColor}} !important;}',
                '.larryms-body .larryms-left{background:{{d.leftColor}} !important;}',
                //body
                'ul.larryms-tab-title .layui-this{background:{{d.navThis}} !important;}',
                '.larryms-right .larryms-tab .larryms-title-box{border-bottom:1px solid  {{d.titBottom}};}',
                '.larryms-right .larryms-tab .larryms-title-box .larryms-tab-title{border-bottom:1px solid  {{d.titBottom}};}',
                //footer
                '.larryms-layout .larryms-footer{background:{{d.footColor}} !important;color:{{d.footFont}} !important;}',
            ].join('')).render(options),
            styleElem = document.getElementById(id);
        // 向主体框架中追加主题样式表
        if('styleSheet' in style){
           style.setAttribute('type', 'text/css');
           style.styleSheet.cssText = styleText;
        } else {
           style.innerHTML = styleText;
        }
        style.id = id;
      
        styleElem && $body[0].removeChild(styleElem);
        $body[0].appendChild(style);
        local.theme = local.theme || {};
        layui.each(options,function(k,v){
             local.theme[k] = v;
        });
        layui.data('larryms',{
            key:'theme',
            value: local.theme
        });
    };
    //主题框架主题初始化
    MainFrame.prototype.init = function(){
        var that = this,
            myTheme = layui.data('larryms').theme,
            systemSet = layui.data('larryms').systemSet;
        //1、检查系统主题配置是否存在
        if( myTheme !== undefined){
            console.log(myTheme.name);
             that.theme(myTheme);
             if(myTheme.name == 'default'){
                $('#Larryms_theme_style').empty();
             }
        }
        //读取系统设置
        if( systemSet !== undefined){
             larryTab.tabSet({
                 tabSession:systemSet.tabCache,
                 autoRefresh:systemSet.tabRefresh
             });
             $('#larry_footer').data('show',systemSet.footSet);
        }else{
            //未设置过主题时将larryTab默认配置写入本地存储
            layui.data('larryms',{
                key:'systemSet',
                value:{
                   tabCache: larryTab.config.tabSession,
                   tabRefresh : larryTab.config.autoRefresh,
                   fullScreen : false,
                   footSet : $('#larry_footer').data('show')
                }
            });
        } 
        
        footerCheck();
        
    };
    MainFrame.prototype.footInit = function(value){
        $('#larry_footer').data('show',value);
        footerCheck();
    };
    function footerCheck(){
        
         // 页脚开启或关闭
        if($('#larry_footer').data('show') !== 'on'){
             $('#larry_footer').hide();
             $('#larry_right').css({bottom:'0px'});
        }else{
             $('#larry_footer').show();
             $('#larry_right').css({bottom:'40px'});
        }
    }






    // 浏览器宽高变化 临时 后续版本中完善
    $(window).on('resize', function() {
      var width = $(window).width();
      if(width>=1200){
        $('#larry_layout').removeClass('larryms-mobile-layout');
        $('#larry_layout').addClass('larryms-unfold').removeClass('larryms-fold');
                $('#menufold').children('i.larry-icon').addClass('larry-fold7').removeClass('larry-unfold');
      }else if (width > 767 && width <1200) {
        $('#larry_layout').removeClass('larryms-mobile-layout');
        $('#larry_layout').addClass('larryms-fold').removeClass('larryms-unfold');
        $('#menufold').children('i.larry-icon').addClass('larry-unfold').removeClass('larry-fold7');
      } else if (width <= 767 && width > 319) {
        $('#larry_layout').removeClass('larryms-fold');
        $('#larry_layout').removeClass('larryms-unfold');
      } else if (width <= 319) {
        larryms.error('你丫的别拖了，没有屏幕宽度小于320的，布局会乱的！', larryms.tit[1]);
      }
      // 移动端屏幕下iframe高度随子页面内容只适应滚动，但min-height填充空白区域，移动端下关闭tab选项卡
    }).resize();


    var larryMain = new MainFrame();
    larryMain.init();
    exports('index',larryMain);
});