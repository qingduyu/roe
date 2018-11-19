/**
 * @name : larryMS框架后台界面主文件
 * @author larry
 * @QQ: 313492783
 * @site : www.larryms.com
 * @Last Modified time: 2018-08-10 15:50:06
 */
var larryTab;
layui.define(['jquery', 'configure', 'larryTab'], function(exports) {
  var $ = layui.$,
    configure = layui.configure,
    layer = layui.layer,
    laytpl = layui.laytpl,
    larryms = layui.larryms,
    common = layui.common,
    form = layui.form,
    $win = $(window),
    $body = $('body'),
    $larrymsElemBox = $('#larry_layout'),
    Themestyles = configure.basePath + 'lib/templets/style/theme.css',
    ThemeUrl = 'lib/templets/theme';
  larryTab = layui.larryTab({
    tab_elem: '#larry_tab',
    tabMax: 30,
    spreadOne: true
  });
  var _initialize = function() {
    if (layui.data('larryms').topMenuSet === undefined) {
      layui.data('larryms', {
        key: 'topMenuSet',
        value: true
      });
    }
    //菜单初始化
    larryTab.menuSet({
      type: 'POST',
      url: layui.cache.menusUrl,
      data: layui.cache.menuData,
      left_menu: '#larryms_left_menu',
      leftFilter: 'LarrySide',
      top_menu: layui.data('larryms').topMenuSet !== false ? '#larryms_top_menu' : false
    });
    larryTab.menu();
    var tabCaches = layui.data('larryms').systemSet === undefined ? false : layui.data('larryms').systemSet.tabCache;
    if (tabCaches) {
      larryTab.session(function(session) {
        if (session.getItem('tabMenu')) {
          $('#larry_tab_title li.layui-this').trigger('click');
        }
      });
    }

  };
  //主框架菜单Tab相关操作
  if (window.top == window.self) {
    _initialize();
  }



  //系统锁屏控制
  var locks = layui.data('larryms').lockscreen,
    sysSet = layui.data('larryms').systemSet;
  if (locks === 'locked') {
    //锁屏
    lockSys();
  }
  if (sysSet) {
    if (sysSet.fullScreen == true) {
      var fScreenIndex = layer.alert('按ESC退出全屏', {
        title: '进入全屏提示信息',
        skin: 'layui-layer-lan',
        closeBtn: 0,
        anim: 4,
        offset: '100px'
      }, function() {
        larryms.fullScreen.entry();
        layer.close(fScreenIndex);
      });
    }
  }


  //主页框架
  $('#larryms_version').text(larryms.version);
  // 菜单折叠
  $('#menufold').on('click', function() {
    if ($('#larry_layout').hasClass('larryms-fold')) {
      $('#larry_layout').addClass('larryms-unfold').removeClass('larryms-fold');
      $(this).children('i').addClass('larry-fold7').removeClass('larry-unfold');
    } else {
      $('#larry_layout').addClass('larryms-fold').removeClass('larryms-unfold');
      $(this).children('i').addClass('larry-unfold').removeClass('larry-fold7');
    }
  });

  // 主题设置
  $('#larryTheme').on('click', function() {
    if ($('#larrymsThemes').length > 0) {
      return false;
    }
    var index = layer.open({
      type: 1,
      id: 'larry_theme_R',
      title: false,
      anim: Math.ceil(Math.random() * 6),
      offset: 'r',
      closeBtn: false,
      shade: 0.2,
      shadeClose: true,
      skin: 'layui-anim layui-anim-rl larryms-layer-right',
      area: '320px',
      success: function(layero, index) {
        layui.link(Themestyles);
        larryms.htmlRender(ThemeUrl, layero);
      },
    });
  });



  var MainFrame = function() {
    this.themeColor = {
      default: {
        topColor: '#1b8fe6',
        topThis: '#1958A6',
        topBottom: '#01AAED',
        leftColor: '#2f3a4f',
        leftRight: '#258ED8',
        navThis: '#1492DD',
        titBottom: '#1E9FFF',
        footColor: '#245c87',
        name: 'default'
      },
      deepBlue: {
        topColor: '#1b8fe6',
        topThis: '#1958A6',
        topBottom: '#01AAED',
        leftColor: '#2f3a4f',
        leftRight: '#258ED8',
        navThis: '#1492DD',
        titBottom: '#1E9FFF',
        footColor: '#245c87',
        name: 'deepBlue'
      },
      green: {
        topColor: '#2a877b',
        topThis: '#5FB878',
        topBottom: '#50A66F',
        leftColor: '#343742',
        leftRight: '#50A66F',
        navThis: '#56a66c',
        titBottom: '#50A66F',
        footColor: '#3e4e63',
        name: 'green'
      },
      navy: {
        topColor: '#2f4056',
        topThis: '#0d51a9',
        topBottom: '#01AAED',
        leftColor: '#393d49',
        leftRight: '#1E9FFF',
        navThis: '#1E9FFF',
        titBottom: '#01AAED',
        footColor: '#343742',
        name: 'navy'
      },
      orange: {
        topColor: '#F39C34',
        topThis: '#CD7013',
        topBottom: '#FF5722',
        leftColor: '#1d1f26',
        leftRight: '#FFB800',
        navThis: '#df7700',
        titBottom: '#FFB800',
        footColor: '#f2f2f2',
        footFont: '#666',
        name: 'orange'
      }
    };

  };

  MainFrame.prototype.theme = function(options) {
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
    if ('styleSheet' in style) {
      style.setAttribute('type', 'text/css');
      style.styleSheet.cssText = styleText;
    } else {
      style.innerHTML = styleText;
    }
    style.id = id;

    styleElem && $body[0].removeChild(styleElem);
    $body[0].appendChild(style);
    local.theme = local.theme || {};
    layui.each(options, function(k, v) {
      local.theme[k] = v;
    });
    layui.data('larryms', {
      key: 'theme',
      value: local.theme
    });
  };
  var treeMobile = $('.site-tree-mobile'),
    shadeMobile = $('.site-mobile-shade'),
    topMenuMobile = $('#larrymsMobileMenu'),
    topMenuShade = $('#larrymsMobileShade'),
    topbarR = $('#rightMenuButton'),
    topbarRshade = $('#larrymsMobileShadeRmenu');

  treeMobile.on('click', function() {
    $body.addClass('mobile-side-show');
    $('#larry_left').removeClass('pt-page-moveToLeftFade');
    $('#larry_left').addClass('pt-page-moveFromLeft');
  });
  shadeMobile.on('click', function() {
    $body.removeClass('mobile-side-show');
    $('#larry_left').removeClass('pt-page-moveFromLeft');
    $('#larry_left').addClass('pt-page-moveToLeftFade');
  });
  //顶部导航菜单显示
  var TPMflag = false;
  topMenuMobile.on('click', function() {
    if (!TPMflag) {
      $('#larryms_top_menu').show();
      $('#larryms_top_menu').addClass('pt-page-moveFromTop');
      $('#larryms_top_menu').removeClass('pt-page-moveToLeftFade');
      topMenuShade.show();
      TPMflag = true;
      console.log(TPMflag);
    } else {
      $('#larryms_top_menu').removeClass('pt-page-moveFromTop');
      $('#larryms_top_menu').addClass('pt-page-moveToLeftFade');
      topMenuShade.hide();
      TPMflag = false;
      console.log(TPMflag);
    }
    if ($('#larryms_top_menu').hasClass('pt-page-moveFromTop')) {
      if ($('#larry_left').hasClass('pt-page-moveFromLeft')) {
        $('#larry_left').removeClass('pt-page-moveFromLeft');
        $('#larry_left').addClass('pt-page-moveToLeftFade');
        $('.site-mobile-shade').click();
      }
    }
  });
  //顶级导航点击时触发左侧菜单展现 仅移动端有效
  $('#larryms_top_menu').on('click', function() {
    if (TPMflag) {
      topMenuMobile.click();
      treeMobile.click();
    }
  });
  topMenuShade.on('click', function() {
    $(this).hide();
    topMenuMobile.click();
  });
  var rightMenuFlag = false;
  topbarR.on('click', function() {
    var h = $('#topbarRMenu').height();
    if (!rightMenuFlag) {
      $("#topbarR").animate({
        'height': h
      });
      rightMenuFlag = true;
      topbarRshade.show();
    } else {
      $("#topbarR").animate({
        'height': '50px'
      });
      rightMenuFlag = false;
      topbarRshade.hide();
    }
  });
  topbarRshade.on('click', function() {
    $(this).hide();
    topbarR.click();
  });
  $('#topbarRMenu li').on('click', function() {
    if (rightMenuFlag) {
      topbarR.click();
    }
  });


  //主框架响应适配
  MainFrame.prototype.responeDevice = function() {
    var that = this,
      devicesType = larryms.deviceType();
    // 针对larryms主框架页面
    if (devicesType.devices == 'mobile') {
      $body.addClass('larryms-mobile');
      $body.removeClass('larryms-pad');
      // $('#larry_left').addClass('pt-page-moveToLeftFade');


      $('#larry_layout').removeClass('larryms-fold');
      $('#larry_layout').removeClass('larryms-unfold');


    } else if (devicesType.devices == 'pad') {
      $body.addClass('larryms-pad');
      $body.removeClass('larryms-mobile');
      $('#larryms_top_menu').removeClass('pt-page-moveToLeftFade');

      $('#larry_left').addClass('pt-page-moveFromLeft');
      $('#larry_left').removeClass('pt-page-moveToLeftFade');

      $('#larry_layout').removeClass('larryms-mobile-layout');
      $('#larry_layout').addClass('larryms-fold').removeClass('larryms-unfold');
      $('#menufold').children('i.larry-icon').addClass('larry-unfold').removeClass('larry-fold7');

    } else if (devicesType.devices == 'pc') {
      $body.removeClass('larryms-mobile');
      $body.removeClass('larryms-pad');

      $('#larryms_top_menu').removeClass('pt-page-moveToLeftFade');
      $('#larry_left').removeClass('pt-page-moveToLeftFade');
      $('#larry_layout').removeClass('larryms-mobile-layout');
      $('#larry_layout').addClass('larryms-unfold').removeClass('larryms-fold');
      $('#menufold').children('i.larry-icon').addClass('larry-fold7').removeClass('larry-unfold');


    }



  };
  //主题框架主题初始化
  MainFrame.prototype.init = function() {
    var that = this,
      myTheme = layui.data('larryms').theme,
      systemSet = layui.data('larryms').systemSet,
      mobileTabSwitch = layui.data('larryms').mobileTabSwitch;

    that.responeDevice();
    //1、检查系统主题配置是否存在
    if (myTheme !== undefined) {
      that.theme(myTheme);
      if (myTheme.name == 'default') {
        $('#Larryms_theme_style').empty();
      }
    }
    //针对移动端
    if (larryms.deviceType().devices == 'mobile') {
      if (mobileTabSwitch == false) {
        that.mobileTab();
      } else if (mobileTabSwitch == undefined) {
        that.mobileTab();
      } else {
        $('#mTabswitch').attr('checked', 'checked');
        $('#larryms_body').addClass('tab-box-show');
        form.render();
      }
    }
    //读取系统设置
    if (systemSet !== undefined) {
      larryTab.tabSet({
        tabSession: systemSet.tabCache,
        autoRefresh: systemSet.tabRefresh,
        isPageEffect: systemSet.pageAnim
      });
      $('#larry_footer').data('show', systemSet.footSet);
    } else {
      //未设置过主题时将larryTab默认配置写入本地存储
      layui.data('larryms', {
        key: 'systemSet',
        value: {
          tabCache: configure.tabSession,
          tabRefresh: configure.tabRefresh,
          topMenuSet: configure.topMenuSet,
          fullScreen: false,
          pageAnim: configure.animations,
          footSet: $('#larry_footer').data('show')
        }
      });
    }

    footerCheck();

  };
  MainFrame.prototype.footInit = function(value) {
    $('#larry_footer').data('show', value);
    footerCheck();
  };
  MainFrame.prototype.fScreen = function(value) {
    if (value) {
      larryms.fullScreen.entry();
    } else {
      larryms.fullScreen.exit();
    }
  }
  MainFrame.prototype.pageAnimInit = function(value) {
    var that = this;
    that.init();
  }
  MainFrame.prototype.menuInit = function() {
    if (layui.data('larryms').topMenuSet !== undefined) {
      top.location.reload(true);
    }
  }
  MainFrame.prototype.mobileTab = function() {
    var mobileTabSwitch = layui.data('larryms').mobileTabSwitch;
    if (mobileTabSwitch) {
      $('#mTabswitch').click();
      $('#larryms_body').addClass('tab-box-show');
      form.render();
    } else {
      $('#mTabswitch').removeAttr("checked");
      form.render();
      $('#larryms_body').removeClass('tab-box-show');
    }
  }
  form.on('switch(mTabswitch)', function(data) {
    if (data.elem.checked) {
      layui.data('larryms', {
        key: 'mobileTabSwitch',
        value: true
      });
      $('#larryms_body').addClass('tab-box-show');
    } else {
      layui.data('larryms', {
        key: 'mobileTabSwitch',
        value: false
      });
      $('#larryms_body').removeClass('tab-box-show');
    }
  });

  function footerCheck() {

    // 页脚开启或关闭
    if ($('#larry_footer').data('show') !== 'on') {
      $('#larry_footer').hide();
      $('#larry_right').css({
        bottom: '0px'
      });
      $('.site-tree-mobile').css({
        bottom: '16px'
      });
    } else {
      $('#larry_footer').show();
      $('#larry_right').css({
        bottom: '40px'
      });
      $('.site-tree-mobile').css({
        bottom: '51px'
      });
    }
  }



  var larryMain = new MainFrame();
  larryMain.init();



  //清除缓存
  $('#clearCached').off('click').on('click', function() {
    larryms.cleanCached.clearAll();
    layer.alert('缓存清除完成!本地存储数据也清理成功！', {
      icon: 1,
      title: '系统提示',
      end: function() {
        top.location.href = location.href; //刷新
      }
    });
  });
  // 退出系统
  $('#logout').off('click').on('click', function() {
    var url = $(this).data('url');

    larryms.confirm('确定退出系统吗?', {

    }, function(res) {
      //此为后端写法之一
      // $.get(url, function(res) {
      //   if (res.code == 200) {
      //     larryms.msg(res.msg);
      //     top.location.href = res.url;
      //   }
      // });
      //前端展示就直接跳转到登录页了
      top.location.href = url;
    }, function() {
      layer.msg('成功返回系统', {
        time: 1000,
        btnAlign: 'c',
      });
    })
  });

  $('#lock').mouseover(function() {
    layer.tips('请按Alt+L快速锁屏！', $(this), {
      tips: [4, '#FF5722'],
      time: 1000
    });
  });
  $('#lock').off('click').on('click', function() {
    lockSys();
  });

  //锁屏
  function lockSys() {



    var img = $('#user_photo').attr('src'),
      name = $('#uname').text();
    locksInterface({
      Display: 'block',
      UserPhoto: img,
      UserName: name
    });
    // 设置锁屏状态存入本地 或后台数据库状态 根据实际需要选择
    //1、仅本地锁屏解锁
    layui.data('larryms', {
      key: 'lockscreen',
      value: 'locked'
    });
    //2、连接数据库
    // 在larryCMS2.0中体现
    startTimer();
  }
  //解锁
  function unlockSys() {
    //验证锁屏密码
    var img = $('#user_photo').attr('src'),
      name = $('#uname').text();
    if ($('#unlock_pass').val() === 'larry') {

      locksInterface({
        Display: 'none',
        UserPhoto: img,
        UserName: name
      });

    } else {
      layer.tips('模拟锁屏，输入密码：larry 解锁', $('#unlock'), {
        tips: [2, '#FF5722'],
        time: 1000
      });
      return;
    }

  }

  // 键盘按键监听
  $(document).keydown(function() {
    return key(arguments[0]);
  });

  function key(e) {
    var keynum;
    if (window.event) {
      keynum = e.keyCode;
    } else if (e.which) {
      keynum = e.which;
    }
    if (e.altKey && keynum == 76) {
      lockSys();
    }
  }

  // 锁屏界面
  function locksInterface(options) {
    var id = 'larry_lock_screen',
      lockScreen = document.createElement('div'),
      interface = laytpl(['<div class="lock-screen" style="display: {{d.Display}};">',
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
    if (options.Display !== 'none') {
      $body[0].appendChild(lockScreen);
    } else {
      $('#larry_lock_screen').empty();
    }
    $('#unlock').off('click').on('click', function() {
      unlockSys();
      layui.data('larryms', {
        key: 'lockscreen',
        value: 'unlock'
      });
    });
    $('#unlock_pass').keypress(function(e) {
      if (window.event && window.event.keyCode == 13) {
        $('#unlock').click();
        return false;
      }
    });
  }

  function startTimer() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = m < 10 ? '0' + m : m;
    s = s < 10 ? '0' + s : s;
    $('#time').html(h + ":" + m + ":" + s);
    t = setTimeout(function() {
      startTimer()
    }, 500);
  }
  // 用户首次进入demo页触发  这里会出发统治
  $(top.document.body).one('click',function(){
      if(!$(this).hasClass('notice-trigger')){
        // noticeDemo();
        $(this).addClass('notice-trigger');
      }
  });
  // function noticeDemo() {
  //
  //
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: '消息通知：点我在选项卡中打开百度Echarts页面！',
  //       url: 'library/charts/echarts.html'
  //     }, {
  //       action: 3,
  //       navid: 75,
  //       navgroup: 1,
  //       navtitle: "百度Echarts",
  //       navfont: "larry-icon",
  //       navicon: "larry-moxing",
  //       hide: 'click'
  //     });
  //   }, 7000);
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: '我没有声音，我可以自动隐藏！',
  //       msgtype: 'success'
  //     }, {
  //       audio: false
  //     });
  //   }, 9000);
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: '重要消息：点我在新窗口查看，也可以右上角点X无视！',
  //       url: 'https://www.larryms.com/cates/5.html',
  //       msgtype: 'danger'
  //     }, {
  //       action: 4,
  //       hide: 'click'
  //     });
  //   }, 13000);
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: '您收到1条测试消息，请点击查看!',
  //       url:'use/notice.html',
  //       msgtype: 'custom',
  //       color:'#fff',
  //       bgcolor:'#1E9FFF'
  //     }, {
  //       action: 3,
  //       navid: 89,
  //       navgroup: 0,
  //       navtitle: "消息推送功能",
  //       navfont: "larry-icon",
  //       navicon: "larry-info",
  //       hide:'click',
  //       font:'fa',
  //       icon:'fa-flag-checkered',
  //     });
  //   }, 18000);
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: '您收到一条 error测试消息!',
  //       msgtype: 'error'
  //     }, {
  //       audio: false,
  //       time:6000
  //     });
  //   }, 24000);
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: '您收到一条 waring消息!',
  //       msgtype: 'warning'
  //     }, {
  //       audio: false
  //     });
  //   }, 27000);
  //   setTimeout(function() {
  //     larryms.notice({
  //       msg: 'LarryMS框架演示中默认关闭了Tab选项卡的加载动画，Tab选项卡切换刷新等功能，可在浏览一遍之后，通过主题设置中开启默认关闭的设置，对比效果。本月2.0.9版本将是重量级更新【如tree组件、模板系列等】！',
  //       msgtype:'custom',
  //       color:'#fff',
  //       bgcolor:'#01CED1'
  //     }, {
  //       hide:'click',
  //       font:'fa',
  //       icon:'fa-universal-access'
  //     });
  //   }, 32000);
  // }
  //onload之后动态加载主页控制台界面
  function createHomePage() {
    var ifrContent = '<iframe src="' + layui.cache.homeUrl + '" id="ifr-0" data-group="0" data-id="ifr0" lay-id="" name="ifr_0" class="larryms-iframe"></iframe>';
    $('#homePage').append(ifrContent);
  }
  if (window.addEventListener) {
    window.addEventListener('load', createHomePage());
  } else if (window.attachEvent) {
    window.attachEvent('onload', createHomePage());
  } else {
    window.onload = createHomePage();
  }

  window.onresize = function() {
    larryMain.responeDevice();
  }
  exports('index', larryMain);
});