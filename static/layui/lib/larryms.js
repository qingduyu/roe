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
layui.define(['jquery','layer','laytpl','element'],function(exports){
    var $ = layui.$,
    layer = layui.layer,
    laytpl = layui.laytpl,
    device = layui.device(),
    element = layui.element,
    doc = document,
    online = false,
    conf = {
      modules:{}//记录自定义模块物理路径
    },
    MOD_NAME = 'larryms',
    //Message模板
    LARRY_INFO = ['<div class="larryms-message" id="messageBox">'
       ,'<div class="larryms-message-box clearfix">'
       ,'<i class="larry-icon {{d.ICONS}}"></i>'
       ,'<div class="resultmsg">{{d.MSG}}</div>'
       ,'</div>'
       ,'</div>'
    ].join(''),
    //获取当前执行js路径或指定js所在相对目录及所在位置
    getPath = function(name){
      var jsPath = new Array();
      if(name !== undefined){
           scripts = doc.getElementsByTagName("script");
           for(var i=0;i<scripts.length;i++){
               if(name == scripts[i].src.substring(scripts[i].src.lastIndexOf('/')+1)){
                  var urlStr = scripts[i].src.split("//")[1];
                  jsPath['commonPath'] = urlStr.substring(urlStr.indexOf('/'),urlStr.lastIndexOf('/layui/')+1);
                  jsPath['url'] = urlStr.substring(urlStr.indexOf('/'),urlStr.lastIndexOf('/layui/')+1)+'plus/';
                  jsPath['index'] = i;
               }
           }
           jsPath['obj'] = scripts;
      }else{
        jsPath['url'] = doc.currentScript? doc.currentScript.src : function(){
           var js = doc.scripts,
           last = js.length-1,
           src;
           for(var i = last;i>0;i--){
             if(js[i].readyState == 'interactive'){
               src = js[i].src;
               break;
             }
           }
           return src || js[last].src;
        }();
        if(jsPath['url'] !== undefined && jsPath['url'] !==''){
             jsPath['names'] = jsPath['url'].substring(jsPath['url'].lastIndexOf('/')+1);
        }else{
            jsPath['names'] = 'layui.js';
        }
      }
      return jsPath;
    },
    //larryms构造器
    larryms = function(){
        this.version = 'LarryMS 2.07 Beta2',
        this.tit = ['LarryMS提示您','larryMS错误提示','larryMS参数配置错误提示','数据源配置错误','关闭失败提示','操作成功','操作失败','LarryMS Ajax 调试信息控制台'],
        this.config ={
            plusDir: '/common/plus/',
            jqDefined:undefined,
            jqUrl:undefined
        },
        this.debug = true,
        this.fonts ={
            icon : undefined,//自定义字体名称
            url:undefined, //自定义字体路径
            online:false
        }
    };
    function removeLink(id){
        var head = document.getElementsByTagName('head')[0],
            links = document.getElementById(id);
        if(links !== null ){
            head.removeChild(links);
        }
        
    }
    /**
     * [fonts description]  //页面字体库加载处理(检查预定义字体库对应css文件是否加载)
     * @param  {[type]} icon [description]
     * @return {[type]}      [description]
     */
    function fonts(icon,url,online) {
      // 默认字体扩展路径
      var cssPath = getPath('layui.js').commonPath;
      if (url == undefined) {
        if ($('.larry-icon').length > 0) {
          larryFonts = cssPath + 'css/fonts/larry-icon.css';
          layui.link(larryFonts);
        }
        if ($('.fa').length > 0) {
          awesomeFonts = cssPath + 'css/fonts/font-awesome.min.css';
          layui.link(awesomeFonts);
        }

      }else {
        if(online) {
            removeLink('layuicss-commoncssfontslarry-iconcss');
            layui.link(url);
        }else {
            layui.link(url);
        } 
      }
    }
    // 初始化
    function init(){
        // 浏览器兼容性检查
        if(device.ie && device.ie < 9 ){
            layer.alert('本系统最低支持ie8，您当前使用的是古老的 IE' + device.ie + ' \n 建议使用IE9及以上版本的现代浏览器',{
                title: '友情提示',
                skin:'larry-debug',
                icon: 2,
                resize: false,
                zIndex: layer.zIndex,
                anim: Math.ceil(Math.random() * 6)}
            );
        }
        // 移动设备判断
        if(device.android || device.ios || $(window).width()<768){
            $('body').addClass('larryms-mobile');
            var mMenu = $('#larrymsMobileMenu'),
                mShade = $('#larrymsMobileShade');
            mMenu.on('click',function(){
                if($('#larry_layout').hasClass('larryms-mobile-layout')){
                      $('#larry_layout').removeClass('larryms-mobile-layout');
                }else{
                  $('#larry_layout').addClass('larryms-mobile-layout');
                }
            });
            mShade.on('click',function(){
                $('#larry_layout').removeClass('larryms-mobile-layout');
            });
        }else{
            $('body').removeClass('larryms-mobile');
        }
        // 处理ie浏览器
        if(device.ie){
           $('.larryms-layout').addClass('larryms-ie');
        }
        //针对chrome浏览器表单样式兼容处理
        
        // input placeholder
        var placeholder='';
        $("input.larry-input[type='text'],input.larry-input[type='password']").on('focus',function(){
          placeholder = $(this).attr('placeholder');
          $(this).attr('placeholder','');
        });
        $("input.larry-input[type='text'],input.larry-input[type='password']").on('blur',function(){
          $(this).attr('placeholder',placeholder);
        });
        // 页面字体库检测
        fonts();
    }
    larryms.prototype.set = function(options) {
        var that = this;
        $.extend(true, that.config, options);
        return that;
    };
    larryms.prototype.font = function(icon,url,online){
        if(icon == 'larry-icon' || icon == 'font-awesome'){
              if($('.larry-icon').length>0 || $('.fa').length>0){
                  this.alert('默认支持的字体库已完成自动加载，或请检查是否修改了默认目录结构未成功加载icon样式，对于默认icon字体请勿使用该方法加载');
                  return false;
              }
        }
        fonts(icon,url,online);
    }
    larryms.prototype.fontset = function(configs){
        var that = this;
        $.extend(true,that.fonts,configs);
        that.font(that.fonts.icon,that.fonts.url,that.fonts.online); 
    }
    larryms.prototype.getPath = function(name){
        return getPath(name);
    }
    /**
     * @return {[type]}
     */
    larryms.prototype.close = function(){
        return layer.close(this.index);
    };
    /**
     * @description 成功提示信息
     * @link https://www.larrycms.com/
     * @author  larry
     * @version  larryMS 2.08
     * @param
     */
    larryms.prototype.success = function(msg,title,time){
        this.close();
        return this.index =  parent.layer.alert(msg, {
                title: title,
                skin:'larry-green',
                icon: 1,
                time: (time || 0) * 1000,
                resize: false,
                zIndex: layer.zIndex,
                anim: Math.ceil(Math.random() * 6)
        });
    };
    /**
     * @description 错误提示信息
     * @link https://www.larrycms.com/
     * @author  larry
     * @QQ号 313492783
     * @version  larryMS 2.08
     * @param
     */
    larryms.prototype.error = function(msg,title,time){
        this.close();
        return this.index = parent.layer.alert(msg,{
              title: title,
              skin:'larry-debug',
              icon: 2,
              time: 0,
              resize: false,
              zIndex: layer.zIndex,
              anim: Math.ceil(Math.random() * 6)
        });
    };
    /**
     * @description larryms弹出信息
     * @link https://www.larrycms.com/
     * @author  larry
     * @QQ号 313492783
     * @version  larryMS 2.08
     * @param msg 弹出消息
     * @param {callback} [回调函数]
     */
    larryms.prototype.alert = function(msg,callback){
         this.close();
         return this.index = layer.alert(msg,{end:callback,scrollbar:false});
    };
    larryms.prototype.tips = function(msg, obj, options){
         layer.tips(msg,obj,options);
    };
    /**
     * @description larryms确认对话框
     * @link https://www.larrycms.com/
     * @author  larry
     * @QQ号 313492783
     * @version  larryMS 2.08
     * @param  msg 提示消息内容
     * @param  affirm 确认的回调函数
     * @param  cancel 取消的回调函数
     * @return {undefined|*}
     */
    larryms.prototype.confirm = function(msg,affirm,cancel){
        var that = this;
        return this.index = layer.confirm(msg,{
          icon: 3,
          skin:'larry-green',
          title: that.tit[0],
          closeBtn: 0,
          skin: 'layui-layer-molv',
          anim: Math.ceil(Math.random() * 6),
          btn: ['确定', '取消']
        },function(){
            if(affirm && typeof affirm === 'function'){
               affirm.call(this);
            }
            that.close();
        },function(){
            if(cancel && typeof cancel === 'function'){
               cancel.call(this);
            }
            that.close();
        });
    };

    /**
     * [消息处理]
     * @Author         larry
     * @DateTime       2017-11-16
     * @QQ群号：290354531
     * @param          {[type]}   msg  [description]
     * @param          {[type]}   mark [description]
     * @param          {[type]}   time [description]
     * @return         {[type]}        [description]
     */
    larryms.prototype.message = function(msg,mark,icon,time){
        var that = this,
            msg = msg || 'default',
            mark = mark || 'other',
            icons = icon || 'larry-xiaolian1',
            flag = 0,
            Time;
        if(time !== undefined && time !== 0){
            Time = time*1000;
        }else if(time == 0){
            Time = 0;
            flag = 1;
        }else{
            Time = 2500;
        }
        if(msg != 'default'){
            if(mark == 'success' || mark == 'error' || mark == 'waring'){
                if(!icon){
                    if(mark =='success'){
                        icons = 'larry-gou';
                    }else if(mark == 'error'){
                        icons = 'larry-cuowu3';
                    }else if(mark =='waring'){
                        icons = 'larry-jinggao3';
                    }
                }else{
                    icons = icon;
                } 
            }
            dialog();
        }else{
            dialog();
        }
        function dialog(){
            return this.index = parent.layer.open({
                type: 1,
                closeBtn: flag, 
                anim: Math.ceil(Math.random() * 6),
                shadeClose: false,
                shade: 0,
                title: false, 
                time: Time,
                area:['600px','auto'],
                resize: false,
                content: laytpl(LARRY_INFO).render({
                     MSG: msg,
                     ICONS: icons
                }),
                offset:'200px',
                success: function(layero, index){
                    if(mark == 'error'){
                        $('#messageBox').addClass('larry-message-error');
                    }else if(mark == 'waring'){
                        $('#messageBox').addClass('larry-message-waring');
                    }
                    var icon_top = ($('#messageBox').height() - 80)/2;
                    $('#messageBox i').css({"margin-top": icon_top});
                    $('#messageBox .resultmsg').width($('#messageBox').width()-130);
                }
            });
        }
    };
    /**
     * @description larryms 加载第三方jq插件
     * @link https://www.larrycms.com/
     * @author  larry
     * @QQ号 313492783
     * @version  larryMS 2.08
     * @param  {[type]}
     * @param  {[type]}
     * @param  {[type]}
     * @return {[type]}
     */
    larryms.prototype.plugin = function(jsName,callback,jsConf){
        if($.isPlainObject(jsConf)){
            if(jsConf.plusDir == undefined){
                jsConf.plusDir = getPath('layui.js').url;
            }
            if(jsConf.jqUrl == undefined){
                jsConf.jqUrl = getPath('layui.js').url;
            }
            this.set(jsConf);
        }else if(!$.isPlainObject(jsConf) && jsConf !== undefined){
            this.error('第三方jQuery插件路径参数配置错误，请书写正确配置格式，否则将从默认路径加载插件！',this.tit[2]);
        }else{
            // 若未配置将设置默认第三方插件存放目录
            this.set({
              plusDir: getPath('layui.js').url,
              jqDefined : null,
              jqUrl: null
            });
        }
        // 加载第三方jq插件
        if(typeof jsName == 'string'){
            var jsPath =  this.config.plusDir+jsName,
                plus = doc.createElement('script');
                plus.type = 'text/javascript';
                plus.src = jsPath;
                plus.async = false;
            // 1、获取当前执行js文件名称及位置
            var name = getPath().names,
                obj = getPath(name).obj[getPath(name).index],
                body = doc.getElementsByTagName("body")[0];
                
            // 2、检查jq执行环境,获取当前调用插件js路径，在其之前插入jq插件
            if(!this.config.jqDefined){
                if(!window.jQuery && $){
                    window.jQuery = $;
                    if(name != 'layui.js'){
                        try{
                          body.insertBefore(plus,obj);
                        }catch(error){

                        }finally{
                          obj = getPath('layui.js').obj[getPath('layui.js').index],
                          body.insertBefore(plus,obj.nextSibling);
                        }
                    }else{
                        body.insertBefore(plus,obj.nextSibling.nextSibling);
                    }
                }else if(window.jQuery && $){
                    if(name != 'layui.js'){
                        try{
                          body.insertBefore(plus,obj);
                        }catch(error){

                        }finally{
                             obj = getPath('layui.js').obj[getPath('layui.js').index],
                             body.insertBefore(plus,obj.nextSibling);
                        }
                    }else{
                        body.insertBefore(plus,obj.nextSibling);
                    }
                }else{
                    this.error('上下文环境中未检测jQuery对象，请正确配置自定义jq插件或手动在页面中引入 否则任何依赖jquery的第三方插件将不能正常运行！！！',this.tit[1]);
                }
                runHack();
            }else{
                //自定义了jq版本
                var jqPath = this.config.jqUrl+this.config.jqDefined,
                head = doc.getElementsByTagName("head")[0];
                jq = doc.createElement('script');
                jq.type = 'text/javascript';
                jq.src = jqPath;
                head.appendChild(jq);
                if(doc.all){
                  jq.onreadystatechange = function(){
                      var states = this.readyState;
                      if(states === 'loaded' || states === 'complete'){
                         window.jQuery = $;
                         if (name != 'layui.js') {
                              try{
                                  body.insertBefore(plus,obj);
                              }catch(error){
                               
                              }finally{
                                  body.appendChild(plus);
                              }
                         } else {
                           body.insertBefore(plus,obj.nextSibling);
                         }
                         runHack();
                      }
                  }
                }else{
                    jq.onload = function(){
                      window.jQuery = $;
                      if(name != 'layui.js'){
                               try{
                                  body.insertBefore(plus,obj);
                              }catch(error){
                               
                              }finally{
                                  body.appendChild(plus);
                              }
                      }else{
                          body.insertBefore(plus,obj.nextSibling);
                      }
                      runHack();
                    }
                }
            }
        }
        // 回调函数处理
        function runHack() {
            // IE
            if (doc.all) {
              plus.onreadystatechange = function() {
                var state = this.readyState;
                if (state === 'loaded' || state === 'complete') {                         
                  callback();
                }
              };
            } else {
              //firefox, chrome
              plus.onload = function() {
                callback();
              };
            }
        }
    }; 
    /**
     * [htmlRender 模板加载]
     * @param  {[type]} templetsUrl [description]
     * @param  {[type]} obj         [description]
     * @return {[type]}             [description]
     */
    larryms.prototype.htmlRender = function(templetsUrl,obj){
        var Url = layui.cache.base+templetsUrl+'.html';
        $.ajax({
           url:Url,
           type:'get',
           dataType:'html',
           async: false,
           success: function(html){
              $(obj).html(html);
           }
        });
    };
    /**
     * @description larryms ajax异步调试信息
     * @link https://www.larrycms.com/
     * @author  larry
     * @QQ号 313492783
     * @version  larryMS 2.08
     * @param  {[XMLHttpRequest]}
     * @param  {[textStatus]}
     * @param  {[errorThrown]}
     * @param  {[thatObj]}
     */
    larryms.prototype.ajaxDebug = function(XMLHttpRequest,textStatus,errorThrown,thatObj){
      if(this.debug){
        if(XMLHttpRequest.readyState == 4){
              var index = layer.open({
                  type: 1,
                  skin: 'larry-debug',
                  shadeClose: false,
                  shade: 0,
                  title: this.tit[7],
                  area: ['800px', '660px'],
                  content: XMLHttpRequest.responseText,
                  resize: true,
                  btn: ['关闭不刷新','关闭并刷新当前页'],
                  yes: function(index, layero) {
                    this.close(index);
                    $(thatObj).removeClass('layui-disabled').prop('disabled', false);
                  },
                  btn2:function(index,layero){
                    this.close(index);
                    location.reload();
                  }
              }); 
        } 
      }else{
          this.error('数据提交失败！',this.tit[0]);
      }        
    };
    // Larryms.prototype.debug = function(msg,callback){
    //      if(this.debug){
    //          this.close();
    //          return this.index = layer.alert(msg,{end:callback,scrollbar:false});
    //      }else{
    //         return true;
    //      }
    // };
    // larryms.prototype.add = function(){

    // };
    // larryms.prototype.delete = function(){

    // };
    // larryms.prototype.edit = function(){

    // };
    // larryms.prototype.select = function(){

    // };
    // larryms.prototype.autocomplete = function(){

    // };
    //清楚本地所有缓存
    larryms.prototype.cleanCached = function(cacheName){
        layui.data(cacheName,null);
        localStorage.clear();
        sessionStorage.clear();
        clearCookie();
    };
    // 退出系统注销登录
    larryms.prototype.logOut = function(url,ok,no){
       this.confirm('确定退出系统吗！',
           function(){
               top.location.href = url;   
           },no=goback);   
    };
   
    function goback(){
        layer.msg('成功返回系统', {
          time: 1000,
          btnAlign: 'c',
        });
    }
    // 清除cookie
    function clearCookie() {
      var keys = document.cookie.match(/[^ =;]+(?=\=)/g);
      if (keys) {
        for (var i = keys.length; i--;)
          document.cookie = keys[i] + '=0;expires=' + new Date(0).toUTCString()
      }
    }
    //自动完成渲染
    if(window.top == window.self){
       init();
    }
    var larry = new larryms();
    exports(MOD_NAME,larry);
});