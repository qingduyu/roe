layui.define(['larry', 'form', 'larryms'], function(exports) {
    var $ = layui.$,
        larry = layui.larry,
        larryms = layui.larryms,
        form = layui.form;

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
                image: layui.cache.imgPath + '1.jpg'
            }, {
                image: layui.cache.imgPath + '2.jpg'
            }, {
                image: layui.cache.imgPath + '3.jpg'
            }]
        });
    }
    larryms.plugin('jquery.supersized.min.js', supersized);
    $('#captchaImg').on('click', function() {
        $(this).attr('src', layui.cache.captcha + "?time=" + Math.random());
    });

    form.on('submit(dologin)', function(data) {
        // $.post(data.form.action,data.field,function(res){
                //#this is your coding
        // }); //以下是模拟实际项目中勿用

        return false;
    });
    exports('indexlogin', {});
});