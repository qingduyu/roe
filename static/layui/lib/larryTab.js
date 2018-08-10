/**
 * @Title: LarryMS
 * @Date: 2017-11-15
 * @Site: www.larrycms.com
 * @Author: Larry
 * @QQ号：313492783
 * @QQ群号码：290354531
 * @Version:larryMS2.08
 * @Last Modified time: 2017-11-15 09:00:00
 */
layui.define(['larryms','larryElem'],function(exports){
     var $ = layui.$,
     larryElem = layui.larryElem,
     larryms = layui.larryms,
     layer = layui.layer,
     MOD_NAME = 'larryTab',
     ELEM = {},
     full_tabIndex = 0,
     NavElem = new Array(),
     LarryTab = function() {
         // 默认配置
         this.config = {
         	data:undefined,//数据源
         	url:undefined,//菜单数据源地址
         	type:'POST',//默认读取方式
         	cached:true,//是否开启菜单数据项缓存
         	top_menu:'#larryms_top_menu',//顶部导航菜单
         	spreadOne:true,//左侧导航菜单是否同时只允许展开一项
         	topFilter:'TopMenu',//顶部菜单过滤器
         	left_menu:'#larryms_left_menu',//左侧导航菜单容器
         	leftFilter:'LarrySide',//左侧菜单过滤器
         	tab_elem:'#larry_tab',//tab选项卡容器
         	tabFilter:'larryTab',//tab过滤器
         	tabSession:true,//是否开启tab选项卡缓存
         	closed:true,//选项卡是否包含删除按钮
         	tabMax:25,//默认允许最大打开选项卡个数
         	autoRefresh:false,//选项卡重新打开时自动刷新操作
         	contextMenu:true,//屏蔽页面右键
         	tabShow:true, //是否开启tab选项卡，pajx相互切换
          pageEffect: 1, //默认展现
         },
         this.fonts ={
         	icon : undefined,//自定义字体名称
         	url:undefined, //自定义字体路径
          online:false
         },
         this.larrymsCache ={
            navHtml:undefined,
            tab:undefined
         }
     },init = function(){
          //刷新内层框架
        $('#larryms_refresh').off('click').on('click',function(){

            $('#larry_tab_content').children('.layui-show').children('iframe').attr('src', $('#larry_tab_content').children('.layui-show').children('iframe').attr('src'));
        });
        //主体框架区域禁止双击选中
        $('body').on("selectstart",function(){return false});
        //常用操作：
        $('#buttonRCtrl').find('dd').each(function() {
            $(this).on('click', function() {
                var eName = $(this).children('a').attr('data-eName');
                tab.tabCtrl(eName);
            });
        });
        
        
     },call = {
        larryMenuClick: function(){
            var TOP_MENU = '#larryms_top_menu',
                groups = $(TOP_MENU).find('li.larryms-this').children('a').data('group');
            var group = groups !== undefined ? groups :'0' ;
            tab.on('click(LarrySide)',group,function(data){      
                tab.tabAdd(data.field);
            })

        }
     };
     
     LarryTab.prototype.set = function(options){
          var that = this;
          $.extend(true,that.config,options);
          return that;
     };
     LarryTab.prototype.font = function(configs){
          var that = this;
          $.extend(true,that.fonts,configs);
          larryms.font(that.fonts.icon,that.fonts.url,that.fonts.online);
     }
     // 菜单独立设置
     LarryTab.prototype.menuSet = function(options){
         var that = this;
         if(!options.hasOwnProperty('url') && !options.hasOwnProperty('data')){
         	larryms.error('数据源解析出错：请设置data或url参数，否则导航菜单无法正常初始化！',larryms.tit[1]);
         	return;
         }
         var allow = ['data','url','type','cached','spreadOne','top_menu','topFilter','left_menu','leftFilter'];
         var option = configFilter(options,allow);
         this.set(option);
     };
     //Tab参数独立设置
     LarryTab.prototype.tabSet = function(options){
         var that = this,
             allow = ['tab_elem', 'tabFilter', 'tabSession', 'closed', 'tabMax', 'autoRefresh','tabShow'];
         // 参数检查
         var option = configFilter(options,allow);
          // 传入参数进行配置
         $.extend(that.config, option);
         return that;
     };
    //菜单处理
    LarryTab.prototype.menu = function(){
        var that = this,
            _config = that.config;
        if(_config.data === undefined && _config.url === undefined ){
        	larryms.error('LarryMS Error: 请为菜单项配置数据源[data || url]',larryms.tit[1]);
        	return;
        }
        if(_config.data !==undefined && typeof(_config.data) === 'object'){
        	console.log('设置了data');
        }else{
        	if(_config.url !== undefined){
        		$.ajax({
                   type:_config.type,
                   url:_config.url,
                   async:false,
                   dataType:'json',
                   success:function(result,status,xhr){
                   	   that.larryCompleteMenu(result.data);
                   },
                   error:function(xhr,status,error){
                   	   larryms.error('larryMS Error:'+error,larryms.tit[1]);
                   },
                   complete:function(){
                      larryElem.render();
                   }
        		});
        	}
        }
        return that;
    };
    /**
     * [larryCompleteMenu 菜单处理程序]
     * @Author         larry
     * @DateTime       2017-11-26
     * @QQ群号：290354531
     * @param          {[type]}   data [description]
     * @return         {[type]}        [description]
     */
    LarryTab.prototype.larryCompleteMenu = function(data){
        var that = this,
           _config = that.config,
           $topNav = elemCheck(_config.top_menu,'top_menu'),
           $leftNav = elemCheck(_config.left_menu,'left_menu');
        // 检查左侧核心导航容器设置
        if($leftNav !== 'error'){
        	// 检查是否开启顶部顶级导航
            if($topNav != 'undefined'){
               // 开启了顶部菜单导航
               var html = getHtml(data,'on');
               // 将html数据缓存
               layui.data('larry_menu',{
                   key: 'navHtml',
                   value: html
               });
               // 生成初始化菜单数据
               $topNav.html(html.top);
               $leftNav.html(html.left[0]);
               _config.top_menu = $topNav;
               _config.left_menu = $leftNav;
            }else{
               //未开启顶部菜单导航
               var html = getHtml(data,'off');
               layui.data('larry_menu',{
                   key: 'navHtml',
                   value: html
               });
               $leftNav.html(html);
               _config.left_menu = $leftNav;
            }
        }

    };

    LarryTab.prototype.on = function(events,groups,callback){
        var that = this,
            _config = that.config,
            res = eventsCheck(events),
            group = (groups !== undefined) ? groups : '0';
        // 顶级菜单点击事件响应
        if(res.eventName === 'click' && res.filter === _config.topFilter){
             // 左侧菜单生成
             _config.left_menu.empty();
             _config.left_menu.attr('data-group',group);
             _config.left_menu.html(layui.data('larry_menu').navHtml.left[group]);
             larryElem.render('nav');
             return 'success';
        }
        // 左侧导航监听事件
        if(res.eventName === 'click' && res.filter === _config.leftFilter){
            var itemElem = _config.left_menu.find('li');

            itemElem.each(function(){
                var oitem = $(this),
                    child = oitem.find('dl'),
                    grandson = oitem.find('.grandson');

                // 是否只允许同时展开一个菜单
                if(_config.spreadOne){
                    oitem.on('click',function(){
                        if(oitem.hasClass('larryms-nav-itemed')){
                            oitem.siblings().removeClass('larryms-nav-itemed');
                        }
                    });
                }
                // 菜单点击事件处理
                if(child.length>0){
                    child.children('dd').each(function(){
                        var $this = $(this);
                        $(this).on('click',function(){
                             if(!$this.hasClass('grandson')){
                                var $a = $(this).children('a'),
                                    larryID = $a.data('id'),
                                    href = $a.data('url'),
                                    font = $a.children('i:first').data('font'),
                                    icon = $a.children('i:first').data('icon'),
                                    title = $a.children('cite').text(),
                                    data = {
                                        elem: $a,
                                        field: {
                                            id: larryID,
                                            href: href,
                                            font: font,
                                            icon: icon,
                                            title: title,
                                            group: group
                                        }
                                    };
                                callback(data);
                             } 
                        });
                    })
                }else{
                    oitem.on('click',function(){
                        var $a = oitem.children('a'),
                            larryID = $a.data('id'),
                            href= $a.data('url'),
                            font= $a.children('i:first').data('font'),
                            icon= $a.children('i:first').data('icon'),
                            title= $a.children('cite').text(),
                            data = {
                                elem: $a,
                                field: {
                                    id: larryID,
                                    href: href,
                                    font: font,
                                    icon: icon,
                                    title: title,
                                    group: group
                                }
                            };
                        callback(data);
                    })
                }
 
            }) 
        }
    }
    LarryTab.prototype.tabInit = function(){
        var that = this,
           _config = that.config;
        $container = elemCheck(_config.tab_elem,'tab_elem');
        _config.tab_elem = $container;
        ELEM.titleBox = $container.children('#larryms_title').children('ul.larryms-tab-title');
        ELEM.contentBox = $container.children('.larryms-tab-content');
        ELEM.tabFilter = $container.attr('lay-filter');
        ELEM.tabCtrBox = $container.find('#buttonRCtrl');
        return that;
    };
    /**
     * [exists tab选项卡定位查找:不存在返回-1，id不存在 title存在返回 pageIndex 和 i，id和title都存在返回索引值]
     * @Author         larry
     * @DateTime       2017-11-30
     * @QQ群号：290354531
     * @param          {[type]}   id    [description]
     * @param          {[type]}   title [description]
     * @return         {[type]}         [description]
     * @return {pflag} [是否允许页面新增]
     */
    LarryTab.prototype.exists = function(title,id,url){
        var index = {
               tabIndex: -1,
               pageIndex:undefined,
               pflag:0,
               id:0,
               pages:'nav'
            },
            that = ELEM.titleBox === undefined ? this.tabInit() : this;
        ELEM.titleBox.find('li').each(function(i,e){
            var $cite = $(this).children('cite'),
                navid = $(this).data('id'),
                attrID = $(this).attr('id'),
                attrUrl= $(this).data('url'),
                layId = $(this).attr('lay-id');
            if(id !== undefined){
                //来自nav 导航菜单新增
                index.pages = 'nav';
                if($cite.text() === title && navid === id){
                     index.tabIndex = i;
                }else if(navid === undefined || navid !== id){
                    if($cite.text() === title && attrID === 'larryms_home'){
                        index.tabIndex = 0;
                    }
                }   
            }else{
                //来自页面新增
                index.pages = 'page';
                if($cite.text() === title ){
                     if(attrUrl === url){
                        index.tabIndex = i;
                        index.pflag = i;
                        index.id = layId;
                     }else{
                        index.pageIndex = i;
                     }
                     return index;
                }else{
                   index.pageIndex = -1;
                }
            }
        });
        return index;
    };
    LarryTab.prototype.getTabId = function(title){
        var tabId = -1,
            that = ELEM.titleBox === undefined ? this.tabInit() : this;
        ELEM.titleBox.find('li').each(function(i,e){
            var $cite = $(this).children('cite');
            if($cite.text() === title){
               tabId = $(this).attr('lay-id');
            }
        });
        return tabId;
    };
    LarryTab.prototype.getCurrentTabId = function(){
        var that = this,
            _config = that.config;
        return $(_config.tab_elem).find('ul.larryms-tab-title').children('li.layui-this').attr('lay-id');
    };
    /**
     * [tabAdd 选项卡新增（导航新增，页面新增）]
     * @Author         larry
     * @DateTime       2017-11-30
     * @QQ群号：290354531
     * @param          {[type]}   data [description]
     * @return         {[type]}        [description]
     */
    LarryTab.prototype.tabAdd = function(data){
        var that = this,
             _config = that.config,
             content = '',
             title = '',
             index = that.exists(data.title,data.id,data.href);
        // 若选项卡不存在
        if(index.tabIndex == -1){
           // 判断页面中选项卡已打开的个数
           if(_config.tabMax !=='undefined'){
               var currentTabCount = ELEM.titleBox.children('li').length,
                   msg = _config.tabMax.tipMsg || '为了保障系统流畅运行，只允许同时打开'+_config.tabMax+'个选项卡，或请设置允许新增选项卡个数';
               if(typeof _config.tabMax === 'number'){
                   if(currentTabCount === _config.tabMax){
                      larryms.error(msg,larryms.tit[1]);
                      return;
                   }
               }
               if(typeof _config.tabMax  === 'object' || typeof _config.tabMax === 'string'){
                    if(currentTabCount === _config.tabMx.max){
                        larryms.error(msg,larryms.tit[1]);
                        return;
                    }
               }
           }
           // 选项卡新增(导航菜单选项卡方式打开新增 || 页面选项卡新增)
           if(!_config.tabSession){
               console.log(_config.tabSession);
               full_tabIndex++; 
           }else{
               that.session(function(session){
                   var natives =  JSON.parse(session.getItem('tabMenu'));
                   var id_nums = new Array();
                   for(i=0;i<natives.length;i++){
                      id_nums[i]= natives[i]['id'];
                   }
                   full_tabIndex = Math.max.apply(null,id_nums);
                   full_tabIndex++; 
               });
           }
           
           if(index.pageIndex == undefined){
            //导航菜单新增
              if(data.font !== undefined){
                  if(data.icon !== undefined){
                     title += '<i class="'+data.font+' '+data.icon+'" data-icon="'+data.icon+'"></i>';
                  }
              }else{
                 title +='<i class="larry-icon '+data.icon+'" data-icon="'+data.icon+'"></i>';
              }
              title += '<cite>'+data.title+'</cite>';
              if(_config.closed){
                 title +='<i class="layui-icon layui-unselect layui-tab-close" data-id="'+ full_tabIndex +'">&#x1006;</i>';
              }
              // iframe方式添加
              content = '<iframe src="'+data.href+'" id="ifr'+full_tabIndex+'" data-group="'+data.group+'" data-id="'+data.id+'" lay-id="'+full_tabIndex+'" name="ifr_'+full_tabIndex+'" class="larryms-iframe"></iframe>';
              // tab添加
              larryElem.tabAdd(ELEM.tabFilter,{
                  title: title,
                  content: content,
                  id: full_tabIndex,
                  larryID: data.id,
                  url:data.href,
                  group:data.group,
                  pages: index.pages
              });
              
              
              // 新增tab后的系列动作 
                that.tabChange(full_tabIndex);
                that.tabAuto(0);
                that.pageEffect(5,true);
           }else{
             //来自页面新增
             
           }
           // iframe处理
           

           //页面效果处理
              that.pageEffect(full_tabIndex,Math.ceil(Math.random() * 5));
           //监听关闭事件
           if (_config.closed) {
                ELEM.titleBox.find('li').children('i.layui-tab-close[data-id=' + full_tabIndex + ']').on('click', function() {
                  that.tabDelete($(this).parent('li').attr('lay-id'));
                  that.tabAuto(1);
                });
            }
            //设置tab缓存
            if (_config.tabSession) {
                that.session(function(session) {
                    // 先读取已有session
                    var tabMenu = JSON.parse(session.getItem('tabMenu')) || [];
                    var currentTab = {
                        title: data.title,
                        href: data.href,
                        font: data.font,
                        icon: data.icon,
                        closed: _config.closed,
                        group: data.group,
                        id: full_tabIndex,
                        larryID: data.id
                    };
                    tabMenu.push(currentTab);
                    session.setItem('tabMenu', JSON.stringify(tabMenu));
                    session.setItem('currentTabMenu', JSON.stringify(currentTab));
              })
            }
        }else{
           // 选项卡已存在
             if(!index.pflag){
                  var changeId = that.getTabId(data.title);
                  that.tabChange(changeId);
                  that.autoRefresh(changeId);
                  that.tabAuto(0);
             }else{
                //来自页面新增已存在完全相同的选项卡时
                ELEM.titleBox.find('li[lay-id='+index.id+']').click();
                that.autoRefresh(index.id);
                ELEM.tabCtrBox.find('#tabCtrD').click();
                that.tabAuto(0);
             }             
        }
    };
    /**
     * [pageEffect 页面加载效果--随机展现]
     * @param  {[type]} id     [description]
     * @param  {[type]} status [description]
     * @return {[type]}        [description]
     */
    LarryTab.prototype.pageEffect = function(id,status){
        switch(status){
            case 1:
               
               break;
            case 2:
               
               break;
            case 3:
               
               break;
            case 4:
              
               break;
            default :

               break;
        }
    };

    LarryTab.prototype.recoveryTab = function(tab){
        var that = this,
            _config = that.config,
            index = that.exists(tab.title,tab.id,tab.href);
        if(index.tabIndex == -1){
            var title = '';
            if(tab.font !== undefined){
                if(tab.icon !== undefined){
                    title += '<i class="'+tab.font+' '+tab.icon+'" data-icon="'+tab.icon+'"></i>';
                }
            }else{
                title +='<i class="larry-icon '+tab.icon+'" data-icon="'+tab.icon+'"></i>';
            }
            title += '<cite>'+tab.title+'</cite>';
              if(_config.closed){
                 title +='<i class="layui-icon layui-unselect layui-tab-close" data-id="'+ tab.id +'">&#x1006;</i>';
              }
              // iframe方式添加
             var content = '<iframe src="'+tab.href+'" id="ifr'+tab.id+'" data-group="'+tab.group+'" data-id="'+tab.LarryID+'" lay-id="'+tab.id+'" name="ifr_'+tab.id+'" class="larryms-iframe"></iframe>';
              // tab添加
              larryElem.tabAdd(ELEM.tabFilter,{
                  title: title,
                  content: content,
                  id: tab.id,
                  larryID: tab.larryID,
                  url:tab.href,
                  font: tab.font,
                  icon: tab.icon,
                  group:tab.group,
                  closed: tab.closed,
                  pages: index.pages
              });

        }else{
          // 选项卡已存在
             that.session(function(session){
                  var currentTabMenu = JSON.parse(session.getItem('currentTabMenu'));
                  if(currentTabMenu.id !== '0'){
                      $('#larryms_home').removeClass('layui-this');
                  }
             });
        }
    };
    LarryTab.prototype.tabChange = function(layid,derail,flag){
        var that = this,
           derail = derail || 'off',
           flag = flag || 'nav';
        // 切换时对应左侧导航点击
        if(that.config.tabSession){
             that.session(function(session){
                 var prevTabMenu = JSON.parse(session.getItem('currentTabMenu'));
                  if (!prevTabMenu) return false;
                  if (prevTabMenu.id != layid) {
                    var tabMenu = JSON.parse(session.getItem('tabMenu'));
                    for (var i = 0; i < tabMenu.length; i++) {
                      if (tabMenu[i].id == layid) {
                        session.setItem('currentTabMenu', JSON.stringify(tabMenu[i]));
                        break;
                      }
                    }
                  }
             });
        }
        if(derail === 'on'){
            var TopMenu = $(that.config.top_menu),
                LeftMenu = $(that.config.left_menu),
                $tab_li = $('#larry_tab_title li[lay-id="'+layid+'"]'),
                larryID = $tab_li.data('id'),
                group = $tab_li.data('group');
            if(larryID === 'larryms-home'){
                var title = $tab_li.children('cite').text();
            }
            var navA = LeftMenu.find('a');
            if(navA.length == 0){
                TopMenu.children('li').eq(group).click();
                $tab_li.click();
            }
            $.each(navA,function(k,v){
                var navGroup = $(v).data('group'),
                    navIndex = $(v).data('id'),
                    parents = $('.larryms-nav-tree');
                if( navGroup !== undefined && navGroup === group){
                     larrymsTabLiClick(v,navIndex,parents,larryID,title);
                }else if(navGroup !== group && navGroup !== undefined){
                     TopMenu.children('li').eq(group).click();
                     $tab_li.click();
                     larrymsTabLiClick(v,navIndex,parents,larryID,title);
                }
            });



            function larrymsTabLiClick(v,navIndex,parents,larryID,title){
                    if(navIndex !== undefined && navIndex === larryID){
                        parents.find('.larryms-this').removeClass('larryms-this');
                        parents.find('.larryms-nav-itemed').removeClass('larryms-nav-itemed');
                        parents.find('.grandsoned').removeClass('grandsoned');
                        if($(v).parents('dd').hasClass('grandson')){
                            $(v).parents('li').addClass('larryms-nav-itemed');
                            $(v).parents('dd.grandson').addClass('grandsoned');
                            $(v).parent('dd').addClass('larryms-this');
                        }else if( !$(v).parents('dd').hasClass('grandson') && $(v).parent('dd').length){
                            $(v).parents('li').addClass('larryms-nav-itemed');
                            $(v).parent('dd').addClass('larryms-this');
                        }else{
                            $(v).parent('li').addClass('larryms-this');
                        }
                       return false;
                    }else if(larryID === 'larryms-home' && navIndex !== undefined){
                        if($(v).children('cite').text() === title){
                           parents.find('.larryms-this').removeClass('larryms-this');
                           $(v).parent('li').addClass('larryms-this');
                           return false;
                        }
                    }
            }
        }

        larryElem.tabChange(that.config.tabFilter,layid,flag).render();

    };
    LarryTab.prototype.tabDelete = function(layid){
        var that = this;
        if (that.config.tabSession){
            that.session(function(session){
                var tabMenu = JSON.parse(session.getItem('tabMenu'));
                for (var i = 0; i < tabMenu.length; i++) {
                  if (tabMenu[i].id == layid) {
                    tabMenu.splice(i, 1);
                  }
                }
                session.setItem('tabMenu', JSON.stringify(tabMenu));
                var currentTabMenu = JSON.parse(session.getItem('currentTabMenu'));
                if (currentTabMenu.id == layid) {
                  session.setItem('currentTabMenu', JSON.stringify(tabMenu.pop()));
                }
            });
        }
        var larry = larryElem.tabDelete(that.config.tabFilter,layid).render();
        that.tabChange(larry.larryElem.LarryLayID,'on');
        that.tabAuto(1);
    };
    /**
     * [tabAuto tab选项卡响应式支持]
     * @param  {[type]} tabIndex [description]
     * @param  {[type]} scene    [场景选择1为删除选项卡，0 为新增或切换选项卡状态]
     * @return {[type]}          [description]
     */
    LarryTab.prototype.tabAuto = function(scene){
         var that = this;
         $('#larryms_title').each(function(){
              var othis = $(this),
                  title = othis.children('.larryms-tab-title'),
                  $this_li = title.find('.layui-this'),
                  $home = title.children('#larryms_home'),
                  $arrow = othis.find('.larryms-btn-default'),
                  all_li_w = 0;
              title.find('li').each(function(k,o){
                  all_li_w += parseInt($(o).outerWidth(true));
              });
              if(!title.find('li')[0]) return;
              // tab选项卡响应式支持
              $(window).off('resize').on('resize',function(){
                  var title_w = parseInt(othis.outerWidth(true) - 264),
                      cur_li_w = parseInt($this_li.outerWidth(true)),
                      cur_li_pos = parseInt($this_li.position().left+1),
                      cur_tab_ml = parseInt(title.css("marginLeft")),
                      cur_margin = cur_li_pos + cur_tab_ml,
                      ml_w = title_w - all_li_w;
                  if(all_li_w > title_w){
                      $arrow.removeClass('hide');
                      othis.addClass('larryms-tab-auto');
                      if(cur_tab_ml+cur_li_pos<=0){
                          ml_w = 0 - cur_li_pos;
                      }else{
                         var is_show = title_w+Math.abs(cur_tab_ml)- cur_li_pos - cur_li_w;
                        if(is_show<=0){
                            ml_w = title_w - cur_li_pos - cur_li_w;
                        }else{
                            ml_w = title_w - cur_li_pos - cur_li_w;
                            if(scene == 0){
                                if(ml_w>0){
                                   ml_w = 0;
                                }
                            }else{
                                if(ml_w>0){
                                   ml_w = 0;
                                }
                            }
                        }
                      }
                      title.css({
                         "marginLeft": ml_w
                      });
                  }else{
                      $arrow.addClass('hide');
                      othis.removeClass('larryms-tab-auto');
                      title.css({
                         "marginLeft": 0
                      });
                  }

                  // A、绑定左右箭头点击事件
                  $('.larryms-btn-default').off('click').on('click',function(){
                      if(all_li_w > title_w){
                          var curTabM = parseInt(title.css('marginLeft'));
                          if($(this).attr('id') === 'goLeft'){
                              if(Math.abs(curTabM) !== 0){
                                  if(curTabM+title_w<0){
                                      title.css({
                                          "marginLeft":curTabM+title_w
                                      });
                                  }else{
                                      title.css({
                                          "marginLeft":0
                                      });
                                  }
                              }else{
                                  layer.tips('已滚动到最左侧了',$(this),{
                                      tips: [1, '#FF5722']
                                  });
                              }
                          }
                          if($(this).attr('id') === 'goRight'){
                              if( Math.abs(curTabM) !== (all_li_w - title_w)){
                                  if(Math.abs(curTabM)+title_w >= (all_li_w - cur_li_w)){
                                      title.css({
                                          "marginLeft": title_w - all_li_w
                                      }); 
                                  }else{
                                      title.css({
                                          "marginLeft": curTabM - (title_w/2)
                                      });
                                  }
                              }else{
                                  layer.tips('已滚动到最右侧了',$(this),{
                                      tips: [1, '#FF5722']
                                  });
                              }
                          }
                      }
                  });
              }).resize();
         });
    };
    LarryTab.prototype.tabCtrl = function(eventsName){
        var that = this,
            _config = that.config,
            currentTabId = that.getCurrentTabId();
        switch(eventsName){
            case 'positionCurrent': //定位当前选项卡
              var $cur_li = $(_config.tab_elem).find('ul.layui-tab-title').children('li.layui-this'),
                  cur_url = $(_config.tab_elem).find('iframe[lay-id="'+currentTabId+'"]').attr('src'),
                  cur_font = $cur_li.children('i:first').data('font'),
                  cur_icon = $cur_li.children('i:first').data('icon'),
                  cur_group = $cur_li.data('group'),
                  larryID = $cur_li.data('id'),
                  cur_data = {
                     title: $cur_li.children('cite').text(),
                     href: cur_url,
                     font: cur_font,
                     icon: cur_icon,
                     group: cur_group,
                     id: larryID,
                  };
                that.tabAdd(cur_data);
                that.tabAuto(0);
                break;
            case 'closeCurrent': //关闭当前选项卡
              if(currentTabId>0){
                  that.tabDelete(currentTabId);
              }else{
                  larryms.error('默认首页不能关闭的哦！',larryms.tit[0]);
              }  
                break;
              
            case 'closeOther': //关闭其他选项卡
                var $li = $(_config.tab_elem).find('ul.layui-tab-title').children('li'),
                    li_num = $li.length;
                if(li_num > 2){
                    $li.each(function(){
                        var $this = $(this),
                            layid = $this.attr('lay-id');
                        if(layid !== currentTabId && layid !== undefined && layid !== "0"){
                            that.tabDelete(layid);
                        }
                    });
                }else if( li_num == 2){
                    larryms.error('【默认首页】不能关闭，当前暂无其他可关闭选项卡！',larryms.tit[0]);
                }else{
                    larryms.error('当前暂无其他可关闭选项卡！',larryms.tit[0]);
                }
                break;
            case 'closeAll': //关闭全部选项卡
                var $li = $(_config.tab_elem).find('ul.layui-tab-title').children('li'),
                    li_num = $li.length;
                if(li_num>1){
                   $li.each(function(){
                        var $this = $(this),
                            layid = $this.attr('lay-id');
                        if(layid > 0){
                            that.tabDelete(layid);
                        }
                   });
                }else{
                   larryms.error('当前暂无其他可关闭选项卡！',larryms.tit[0]);
                }
                break;
            case 'refreshAdmin': //刷新外层框架
                larryms.confirm('您确定要重新加载系统吗！',function(){
                    location.reload();
                },function(){
                    return;
                });
                break;
        }
    };
    /**
     * [render 组件核心功能 渲染初始化菜单及选项卡]
     * @Author         larry
     * @DateTime       2017-11-30
     * @QQ群号：290354531
     * @return         {[type]}   [description]
     */
    LarryTab.prototype.render = function(){
        var othis = this,
            _config = othis.config,
            TOP_MENU = _config.top_menu !== undefined ? _config.top_menu : '#larryms_top_menu',
            LEFT_MENU = _config.left_menu !== undefined ? _config.left_menu : '#larryms_left_menu';

        // 1、顶级菜单开启 点击事件监听
        if(_config.top_menu !== undefined){
            $(TOP_MENU).on('click','li',function(){
               var othis = $(this),
                   group = othis.children('a').data('group');
               tab.on('click('+_config.topFilter+')',group);
               $(LEFT_MENU).off('mouseenter',call.larryMenuClick).one('mouseenter',call.larryMenuClick);
            });
        }
        // 菜单切换后左侧导航点击事件监听
        $(LEFT_MENU).one('mouseenter',call.larryMenuClick); 
        
        var tabSessions = layui.data('larryms').systemSet == undefined ? true : layui.data('larryms').systemSet.tabCache ;
        
        if(!tabSessions){
             _config.tabSession = tabSessions;
             sessionStorage.removeItem('tabMenu');
             sessionStorage.removeItem('currentTabMenu');
        }

        othis.session(function(session) {
          // tab选项卡初始化;检查是否开启了tabSession
          if (_config.tabSession) {
              // 检查是否存在sessionStorage中是否存在tabMenu
              if (session.getItem('tabMenu')) {
                  // sessionStorage中检查存在tabMenu开始还原
                  var tabMenus = JSON.parse(session.getItem('tabMenu'));
                  $.each(tabMenus,function(k,v){
                       othis.recoveryTab(v);
                  });
                  var currentTabMenu = JSON.parse(session.getItem('currentTabMenu'));
                  if(currentTabMenu){
                       othis.tabChange(currentTabMenu.id,'on');
                       othis.tabAuto(1);
                  } else {
                       othis.tabChange(tabMenus[0].id,'on');
                       othis.tabAuto(1);
                  }
                  full_tabIndex = tabMenus.length;

              } else { // sessionStorage中不存在tabMenu
                  // 首页存入session
                  var tabFirst = $('#larry_tab_title li').eq(0);
                  if(tabFirst.length){
                      // 读取session
                      var tabMenu = JSON.parse(session.getItem('tabMenu')) || [];
                      var current = {
                           font: tabFirst.children('i').data('font'),
                           icon: tabFirst.children('i').data('icon'),
                           title: tabFirst.find('cite').text() == undefined ? tabFirst.find('cite').text() : '后台首页',
                           href: tabFirst.data('url'),
                           id: tabFirst.attr('lay-id'),
                           LarryID: tabFirst.data('id'),
                           closed:false
                      };
                      tabMenu.push(current);
                      session.setItem('tabMenu', JSON.stringify(tabMenu));
                      session.setItem('currentTabMenu', JSON.stringify(current));
                  }
              }
          }
        });

        $('#larry_tab').on("click", "#larry_tab_title li i.layui-tab-close", function() {
          if (_config.closed) {
            othis.tabDelete($(this).parent("li").attr('lay-id'));
            othis.tabAuto(1);
          }
        });
        
        // 选项卡切换事件，对应导航菜单选中处理
        $('#larry_tab').on("click", "#larry_tab_title li",function(){
              var clickID = $(this).attr('lay-id');
              othis.tabChange(clickID,'on');
              othis.autoRefresh(clickID);
        });
        
     }











    /**
     * [getHtml json菜单数据处理]
     * @param  {[type]} data   [description]
     * @param  {[type]} status [description]
     * @return {[type]}        [description]
     */
    function getHtml(data,status){
    	// 检查是否有顶部导航
    	if(status == 'on'){
    		var navHtml = {
                 top:'',
                 left:[]
    		};
            // 第一层循环取出top_menu
            for(var i = 0 ;i<data.length;i++){
            	if(i == 0){
            		navHtml.top +='<li class="larryms-nav-item larryms-this">';
            	}else{
            		navHtml.top +='<li class="larryms-nav-item">';
            	}
            	navHtml.top +='<a data-group="' + i + '" data-id="larry-'+data[i].id+'">';
            	navHtml.top +='<i class="'+data[i].font+' ' + data[i].icon +'" data-icon="' + data[i].icon + '" data-font="'+data[i].font+'"></i>';
            	navHtml.top +='<cite>' + data[i].title + '</cite>';
            	navHtml.top += '</a>';
            	navHtml.top += '</li>';
                // 左侧二级导航
                if(data[i].children !== undefined && data[i].children !==null && data[i].children.length >0){
                    navHtml.left[i] = '';
                    var submenu ='';
                    for (var j= 0; j < data[i].children.length; j++){
                        submenu = data[i].children[j];
                        if(i ==0 && j==0){
                             // 默认第一组菜单第一级选中或展开
                             if(submenu.children !==undefined && submenu.children !==null && submenu.children.length>0){
                                navHtml.left[i] += '<li class="larryms-nav-item larryms-nav-itemed">';
                             }else{
                                navHtml.left[i] += '<li class="larryms-nav-item larryms-this">';
                             }
                        }else if(submenu.spread && j !=0){
                            navHtml.left[i] += '<li class="larryms-nav-item larryms-nav-itemed">';
                        }else{
                            navHtml.left[i] += '<li class="larryms-nav-item">';
                        }
                        // 有第三级菜单
                        if(submenu.children !== undefined && submenu.children !== null && submenu.children.length >0){
                            navHtml.left[i] +='<a data-group="'+i+'" data-id="larry-'+submenu.id+'">';
                            if(submenu.icon !==undefined && submenu.icon !== ''){
                                if(submenu.font !== undefined && submenu.font !== ''){
                                   navHtml.left[i] += '<i class="'+submenu.font+' ' + submenu.icon +'" data-icon="' + submenu.icon + '" data-font="'+submenu.font+'"></i>';
                                }else{
                                   navHtml.left[i] += '<i class="larry-icon" data-icon="' + submenu.icon + '" data-font="larry-icon"></i>';
                                }
                            }
                            navHtml.left[i] += '<cite>' + submenu.title + '</cite>';
                            navHtml.left[i] += '<span class="larryms-nav-more"></span>';
                            navHtml.left[i] += '</a>';
                            navHtml.left[i] += '<dl class="larryms-nav-child">';
                            // 取出第三级菜单
                            var grandson = '';
                            for( k= 0; k < submenu.children.length; k++){
                                grandson = submenu.children[k];
                                // 存在第四级菜单
                                if(grandson.children !== undefined && grandson.children !== null && grandson.children.length>0){
                                    navHtml.left[i] += '<dd class="grandson">';
                                    navHtml.left[i] += '<a data-group="'+i+'" data-id="larry-'+grandson.id+'">';
                                    if(grandson.icon !== undefined && grandson.icon !== ''){
                                        if(grandson.font !== undefined && grandson.font !== ''){
                                            navHtml.left[i] +='<i class="'+grandson.font+' ' + grandson.icon +'" data-icon="' + grandson.icon + '" data-font="'+grandson.font+'"></i>';
                                        }else{
                                            navHtml.left[i] +='<i class="larry-icon" data-icon="' + grandson.icon + '" data-font="larry-icon"></i>';
                                        }
                                    }
                                    navHtml.left[i] += '<cite>' + grandson.title + '</cite>';
                                    navHtml.left[i] += '<span class="larryms-nav-more"></span>';
                                    navHtml.left[i] += '</a>';
                                    navHtml.left[i] += '<dl class="larryms-nav-child">';
                                    var greatGrandson = '';
                                    for (var l = 0; l<grandson.children.length; l++){
                                        greatGrandson = grandson.children[l];
                                        navHtml.left[i] += '<dd>';
                                        navHtml.left[i] += (greatGrandson.url !== undefined && greatGrandson.url !=='') ? ('<a data-group="'+i+'" data-url="' + greatGrandson.url + '" data-id="larry-'+greatGrandson.id+'">') : '<a data-group="'+i+'" data-id="larry-'+greatGrandson.id+'">';
                                        if(greatGrandson.icon !== undefined && greatGrandson.icon !== ''){
                                            if(greatGrandson.font !== undefined && greatGrandson.font !== ''){
                                                navHtml.left[i] +='<i class="'+greatGrandson.font+' ' + greatGrandson.icon +'" data-icon="' + greatGrandson.icon + '" data-font="'+greatGrandson.font+'"></i>';
                                            }else{
                                                navHtml.left[i] +='<i class="larry-icon" data-icon="' + greatGrandson.icon + '" data-font="larry-icon"></i>';
                                            }
                                        }
                                        navHtml.left[i] += '<cite>' + greatGrandson.title + '</cite>';
                                        navHtml.left[i] += '</a>';
                                    }
                                    navHtml.left[i] += '</dl>';
                                }else{
                                    navHtml.left[i] += '<dd>';
                                    navHtml.left[i] += (grandson.url !== undefined && grandson.url !=='') ? ('<a data-group="'+i+'" data-url="' + grandson.url + '" data-id="larry-'+grandson.id+'">') : '<a data-group="'+i+'" data-id="larry-'+grandson.id+'">';
                                    if(grandson.icon !== undefined && grandson.icon !== ''){
                                        if(grandson.font !== undefined && grandson.font !== ''){
                                            navHtml.left[i] +='<i class="'+grandson.font+' ' + grandson.icon +'" data-icon="' + grandson.icon + '" data-font="'+grandson.font+'"></i>';
                                        }else{
                                            navHtml.left[i] +='<i class="larry-icon" data-icon="' + grandson.icon + '" data-font="larry-icon"></i>';
                                        }
                                    }
                                    navHtml.left[i] += '<cite>' + grandson.title + '</cite>';
                                    navHtml.left[i] += '</a>';
                                }
                                navHtml.left[i] += '</dd>';
                            }
                            navHtml.left[i] += '</dl>';
                        }else{
                            // 无第三级菜单
                            navHtml.left[i] += (submenu.url !== undefined && submenu.url !== '') ? ('<a data-group="'+i+'" data-url="' + submenu.url + '" data-id="larry-'+submenu.id+'">') : '<a data-group="'+i+'" data-id=larry-'+submenu.id+'">';
                            if(submenu.icon !== undefined && submenu.icon !== ''){
                                if(submenu.font !== undefined && submenu.font !== ''){
                                    navHtml.left[i] +='<i class="'+submenu.font+' ' + submenu.icon +'" data-icon="' + submenu.icon + '" data-font="'+submenu.font+'"></i>';
                                }else{
                                    navHtml.left[i] +='<i class="larry-icon" data-icon="' + submenu.icon + '" data-font="larry-icon"></i>';
                                }
                            }
                            navHtml.left[i] += '<cite>' + submenu.title + '</cite>';
                            navHtml.left[i] += '</a>';
                        }
                        navHtml.left[i] += '</li>';
                    }
                }
            }
    	}else{
    		// 未开启顶部菜单导航
    		var navHtml ='';
            // 第一级菜单
            for(var i = 0; i< data.length; i++){
                if(i == 0){
                    navHtml += '<li class="larryms-nav-item">';
                }else{
                    navHtml += '<li class="larryms-nav-item">';
                }
                // 是否有子菜单
                if(data[i].children !== undefined && data[i].children !== null && data[i].children.length>0){
                    navHtml += '<a data-id="larry-'+data[i].id+'">';
                    if(data[i].icon !== undefined && data[i].icon !== null){
                        if(data[i].font !== undefined && data[i].font !== null){
                            navHtml +='<i class="'+data[i].font+' ' + data[i].icon +'" data-icon="' + data[i].icon + '" data-font="'+data[i].font+'"></i>';
                        }else{
                            navHtml +='<i class="larry-icon" data-icon="' + data[i].icon + '" data-font="larry-icon"></i>';
                        }
                    }
                    navHtml += '<cite>' + data[i].title + '</cite>';
                    navHtml += '<span class="larryms-nav-more"></span>';
                    navHtml += '</a>';
                    navHtml += '<dl class="larryms-nav-child">';
                    // 取出第二级菜单
                    var submenu = '';
                    for(var j = 0; j< data[i].children.length; j++){
                        submenu = data[i].children[j];
                        if(submenu.children !== undefined && submenu.children !== null && submenu.children.length>0){
                            // 存在第三级菜单
                            navHtml += '<dd class="grandson">';
                            navHtml += '<a data-id="larry-'+submenu.id+'">';
                                if(submenu.icon !== undefined && submenu.icon !== ''){
                                    if(submenu.font !== undefined && submenu.font !== ''){
                                        navHtml +='<i class="'+submenu.font+' ' + submenu.icon +'" data-icon="' + submenu.icon + '" data-font="'+submenu.font+'"></i>';
                                    }else{
                                        navHtml +='<i class="larry-icon" data-icon="' + submenu.icon + '" data-font="larry-icon"></i>';
                                    }
                                }
                            navHtml += '<cite>' + submenu.title + '</cite>';
                            navHtml += '<span class="larryms-nav-more"></span>';
                            navHtml += '</a>';
                            navHtml += '<dl class="larryms-nav-child">';
                            var grandson = '';
                            for (var k = 0 ; k < submenu.children.length ; k++){
                                grandson = submenu.children[k];
                                navHtml += '<dd>';
                                navHtml += (grandson.url !== undefined && grandson.url !=='') ? ('<a data-url="' + grandson.url + '" data-id="larry-'+grandson.id+'">') : '<a data-id="larry-'+grandson.id+'">';
                                if(grandson.icon !== undefined && grandson.icon !== ''){
                                    if(grandson.font !== undefined && grandson.font !== ''){
                                        navHtml +='<i class="'+grandson.font+' ' + grandson.icon +'" data-icon="' + grandson.icon + '" data-font="'+grandson.font+'"></i>';
                                    }else{
                                        navHtml +='<i class="larry-icon" data-icon="' + grandson.icon + '" data-font="larry-icon"></i>';
                                    }
                                }
                                navHtml += '<cite>' + grandson.title + '</cite>';
                                navHtml += '</a>';
                                navHtml += '</dd>';
                            }
                            navHtml += '</dl>';
                        }else{
                            // 不存在第三级菜单
                            navHtml += '<dd>';
                            navHtml += (submenu.url !== undefined && submenu.url !=='') ? ('<a data-url="' + submenu.url + '" data-id="larry-'+submenu.id+'">') : '<a data-id="larry-'+submenu.id+'">';
                            if(submenu.icon !== undefined && submenu.icon !== ''){
                                if(submenu.font !== undefined && submenu.font !== ''){
                                    navHtml +='<i class="'+submenu.font+' ' + submenu.icon +'" data-icon="' + submenu.icon + '" data-font="'+submenu.font+'"></i>';
                                }else{
                                    navHtml +='<i class="larry-icon" data-icon="' + submenu.icon + '" data-font="larry-icon"></i>';
                                }
                            }
                            navHtml += '<cite>' + submenu.title + '</cite>';
                            navHtml += '</a>'; 
                        }
                        navHtml += '</dd>';
                    }
                    navHtml += '</dl>';
                }else{
                    // 无子菜单
                    navHtml += (data[i].url !== undefined && data[i].url !== '') ? ('<a data-url="' + data[i].url + '" data-id="larry-'+data[i].id+'">') : '<a data-id="larry-'+data[i].id+'">';
                    if(data[i].icon !== undefined && data[i].icon !== ''){
                        if(data[i].font !== undefined && data[i].font !== ''){
                            navHtml +='<i class="'+data[i].font+' ' + data[i].icon +'" data-icon="' + data[i].icon + '" data-font="'+data[i].font+'"></i>';
                        }else{
                            navHtml +='<i class="larry-icon" data-icon="' + data[i].icon + '" data-font="larry-icon"></i>';
                        }
                    }
                    navHtml += '<cite>' + data[i].title + '</cite>';
                    navHtml += '</a>';
                }
                navHtml += '</li>';
            }
    	}

    	return navHtml;
    }

    LarryTab.prototype.autoRefresh = function(changeId){
          var that = this;
          var _config = that.config;
          if (_config.autoRefresh){
              var autoPage = ELEM.contentBox.find('.layui-tab-item').children('iframe[data-id='+changeId+']');
              autoPage.attr('src',autoPage.attr('src'));
          }
    };
    /**
     * [session description] sessionStorage
     * @param  {Function} callback [description]
     * @return {[type]}            [description]
     */
    LarryTab.prototype.session = function(callback){
        if(!window.sessionStorage){
             return false;
        }
        callback(window.sessionStorage);
    };
    /**
     * [configFilter 非法参数过滤]
     * @Author         larry
     * @DateTime       2017-11-26
     * @QQ群号：290354531
     * @param          {[type]}   obj   [传入参数]
     * @param          {[type]}   allow [允许字段]
     * @return         {[type]}         [过滤后的参数]
     */
    function configFilter(obj,allow){
    	var newO = {};
    	for (var o in obj){
    		if($.inArray(o,allow)){
    			newO[o] = obj[o];
    		}
    	}
    	return newO;
    }
    function elemCheck(elem,elemName){
    	var $container;
        if(elemName == 'top_menu'){
        	if(elem === undefined){
               $container = 'undefined';
               return $container;
        	}else{
        	   if(typeof(elem) !== 'string' && typeof(elem) !== 'object'){
                   larryms.error(elemName + '参数未定义或设置出错',larryms.tit[1]);
                   $container = 'error';
                   return $container;
        	   }
        	}
        }else{
        	if(elem !== undefined){
        		if(typeof(elem) !== 'string' && typeof(elem) !== 'object'){
                   larryms.error(elemName + '参数未定义或设置出错',larryms.tit[1]);
                   $container = 'error';
                   return $container;
        	    }
        	}else{
        		larryms.error('未设置【'+elemName+'】参数，请检查参数配置项',larryms.tit[1]);
        		$container = 'error';
                return $container;
        	}
        }
        //传入字符串
    	if(typeof(elem) === 'string'){
    		$container = $(''+elem+'');
    	}
    	// 传入对象
    	if(typeof(elem) === 'object'){
    		$container = elem;
    	}
    	if($container.length === 0){
    		larryms.error('您虽然设置了'+elemName+'参数，但DOM中却查找不到定义的【'+elem+'】元素,请仔细检查',larryms.tit[1]);
    		$container = 'error';
    		return $container;
    	}

    	var filter  = $container.attr('lay-filter');
    	if(filter === undefined  || filter === ''){
    		larryms.error('请为【'+elem+'】容器设置lay-filter属性',larryms.error[0]);
    	}
        return $container;
    }

    function eventsCheck(events){
        var result = {
            eventName: '',
            filter:''
        };
        if(typeof(events) !=='string'){
            larryms.error('事件名设置错误，请参考LarryMS API文档.',larryms.tit[2]);
            return;
        }
        var lIndex = events.indexOf('(');
        result.eventName = events.substr(0, lIndex);
        result.filter = events.substring(lIndex + 1, events.indexOf(')'));
        return result;
    }




    LarryTab.prototype.test = function(){
       console.log('LarryTab-test');
    }

     //创建larryTab对象
     window.tab = new LarryTab();

     if(window.top == window.self){
         tab.render();
         init();
     }
     
     exports(MOD_NAME, function(options){
     	return tab.set(options);
     });
});