layui.extend({larryms: "lib/larryms"}).define(["jquery", "configure", "layer", "larryms"], function (e) {
    "use strict";
    var d = layui.$, s = layui.configure, o = layui.layer, c = layui.device(), i = d(window), u = layui.larryms;
    var r = new Function;
    var l = {
        larryms: "lib/larryms",
        larryTab: "lib/larryTab",
        larryElem: "lib/larryElem",
        larryMenu: "lib/larryMenu",
        larryajax: "lib/larryajax",
        larryEditor: "lib/larryEditor",
        larryApi: "lib/larryApi",
        larryTree: "lib/larryTree",
        larrySecret: "lib/larrySecret",
        shuttle: "lib/shuttle",
        face: "lib/face",
        xss: "lib/xss",
        wangEditor: "lib/extend/we/wangEditor",
        echarts: "lib/extend/echarts",
        echartStyle: "lib/extend/echartStyle",
        md5: "lib/extend/md5",
        base64: "lib/extend/base64",
        fullPage: "lib/extend/fullPage",
        geetest: "lib/extend/geetest",
        classie: "lib/extend/classie",
        snapsvg: "lib/extend/svg/snapsvg",
        svgLoader: "lib/extend/svg/svgLoader",
        clipboard: "lib/extend/clipboard",
        swiper: "lib/extend/swiper/swiper",
        ckplayer: "lib/extend/ckplayer/ckplayer",
        countup: "lib/extend/countup",
        qrcode: "lib/extend/qrcode",
        videojs: "lib/extend/video/videojs",
        videojsbrand: "lib/extend/video/plus/videojsbrand",
        videojsplaylist: "lib/extend/video/plus/videojsplaylist",
        videojsplaylistui: "lib/extend/video/plus/videojsplaylistui",
        videojswatermark: "lib/extend/video/plus/videojswatermark",
        flash: "lib/extend/video/flash",
        EvEmitter: "lib/extend/EvEmitter",
        imagesloaded: "lib/extend/imagesloaded",
        jqui: "lib/extend/jqueryui/jqui",
        bigvideo: "lib/extend/video/bigvideo",
        ztree: "lib/extend/ztree/ztree",
        dtree: "lib/extend/dtree/dtree",
        jstree: "lib/extend/jstree/jstree",
        ztreeCheck: "lib/extend/ztree/ztreeCheck",
        ueconfig: "lib/extend/ueditor/ueconfig",
        neconfig: "lib/extend/neditor/neconfig",
        nebase: "lib/extend/neditor/nebase",
        ueditor: "lib/extend/ueditor/ueditor",
        neditor: "lib/extend/neditor/neditor",
        howler: "lib/extend/howler",
        pdfobject: "lib/extend/pdfobject",
        coords: "lib/extend/gridster/coords",
        collision: "lib/extend/gridster/collision",
        draggable: "lib/extend/gridster/draggable",
        gridster: "lib/extend/gridster/gridster",
        fullpages: "lib/extend/fullpage/fullpages",
        cropper: "lib/extend/cropper",
        intro: "lib/extend/intro",
        tinymce: "lib/extend/tinymce/tinymce",
        ckeditor: "lib/extend/ckeditor/ckeditor",
        watermark: "lib/extend/watermark",
        scrolla: "lib/extend/scrolla",
        anijs: "lib/extend/anijs",
        Print: "lib/extend/Print",
        printJS: "lib/extend/printJS",
        Vue: "lib/Vue"
    };
    r.prototype.modules = function () {
        for (var e in l) {
            layui.modules[e] = l[e]
        }
    }();
    if (s.thirdExtend == true) {
        var a = s.basePath + s.thirdDir + "conf.json";
        d.ajaxSettings.async = false;
        d.getJSON(a, function (e) {
            for (var i in e) {
                layui.modules[i] = s.thirdDir + e[i]
            }
        });
        d.ajaxSettings.async = true
    }
    window.larrymsExtend = true;
    layui.cache.extendStyle = s.basePath + "lib/extendStyle/";
    var y = s.modules + s.modsname;
    if (s.uploadUrl) {
        layui.cache.neUploadUrl = s.uploadUrl
    } else {
        layui.cache.neUploadUrl = ""
    }
    if (s.upvideoUrl) {
        layui.cache.neVideoUrl = s.upvideoUrl
    } else {
        layui.cache.neVideoUrl = ""
    }

    function b() {
        var e = i.width();
        if (e >= 1200) {
            return 3
        } else if (e >= 992) {
            return 2
        } else if (e >= 768) {
            return 1
        } else {
            return 0
        }
    }

    r.prototype.init = function () {
        var e = this;
        u.debug = s.debug;
        if (s.browserCheck) {
            if (c.ie && c.ie < 8) {
                o.alert("本系统最低支持ie8，您当前使用的是古老的 IE" + c.ie + " \n 建议使用IE9及以上版本的现代浏览器", {
                    title: u.tit[0],
                    skin: "larry-debug",
                    icon: 2,
                    resize: false,
                    zIndex: o.zIndex,
                    anim: Math.ceil(Math.random() * 6)
                })
            }
            if (c.ie) {
                d("body").addClass("larryms-ie-hack")
            }
        }
        u.screen = b();
        if (s.fontSet) {
            if (s.font !== "larry-icon") {
                layui.link(layui.cache.base + "css/fonts/larry-icon.css")
            }
            u.fontset({font: s.font, url: s.fontUrl, online: s.fontSet})
        } else {
            layui.link(layui.cache.base + "css/fonts/larry-icon.css")
        }
        if (window.top === window.self) {
            layui.use(["larrySecret", "md5"], function () {
                var e = layui.larrySecret, i = layui.md5;
                var r = e.userKey;
                if (s.grantUser && s.grantKey) {
                    var l = u.grantCheck(s.grantUser, s.grantKey, r);
                    if (!l) {
                        console.log("您需要前往larryms.com官网获取产品授权,或检查授权参数是否正确配置");
                        return false
                    }
                } else {
                    console.log("请前往larryms.com官方获取授权密钥,或检查配置文件必填参数");
                    return false
                }
            })
        }
        if (layui.cache.page) {
            layui.cache.page = layui.cache.page.split(",");
            if (d.inArray("larry", layui.cache.page) === -1) {
                var i = {};
                for (var r = 0; r < layui.cache.page.length; r++) {
                    i[layui.cache.page[r]] = y + layui.cache.page[r]
                }
                layui.extend(i);
                layui.use(layui.cache.page)
            }
        }
        if (s.basecore !== "undefined") {
            var l = s.basecore.split(",");
            var a = {};
            for (var r = 0; r < l.length; r++) {
                a[l[r]] = s.modules + l[r]
            }
            layui.extend(a);
            layui.use(s.basecore)
        }
        if (s.modscore) {
            if (layui.cache.modscore == false) {
                return false
            }
            var t = s.corename.split(",");
            var n = {};
            for (var r = 0; r < t.length; r++) {
                n[t[r]] = y + t[r]
            }
            layui.extend(n);
            layui.use(s.corename)
        }
        if (s.animations) {
            layui.link(s.basePath + "lib/extendStyle/animatelib/animations.css")
        }
    }();
    window.onresize = function () {
        u.screen = b()
    };
    e("larry", {})
});