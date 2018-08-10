/**
 * @name 后台首页
 */
layui.define(['jquery','larry'],function(exports){
  "use strict";
	var $ = layui.$,
	    larry = layui.larry,
	    larryms = layui.larryms;

    $('#closeInfo').on('click',function(){
         $('#Minfo').hide();
    });
	   
	$('#shortcut a').off('click').on('click',function(){
          var data = {
               href: $(this).data('url'),
               icon: $(this).data('icon'),
               ids: $(this).data('id'),
               group:$(this).data('group'),
               title:$(this).children('.larry-value').children('cite').text()
          }
          // larry.addTab(data);
    }); 
    // 引入larry-panel操作
    larry.panel();
    
    var myDate = new Date(),
           year = myDate.getFullYear(),
           month = myDate.getMonth()+1,
           day = myDate.getDate(),
           time = myDate.toLocaleTimeString();
       $('#weather').html('您好，现在时间是：'+year+'年'+month+'月'+day+'日 '+time+'（LarryMS官网晚些时候会提供大量实用API接口供大家使用）');
       $('#versionT').text(larryms.version);
    // 百度echarts加入
    larryms.plugin('echarts.js',statistics);

    function statistics() {
    var myChart = echarts.init(document.getElementById('larryCount')),
    option = {
      title: {
        text: '用户访问来源',
        subtext: '纯属虚构',
        x: 'center'
      },
      tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
        orient: 'vertical',
        left: 'left',
        data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
      },
      series: [{
        name: '访问来源',
        type: 'pie',
        radius: '55%',
        center: ['50%', '60%'],
        data: [{
          value: 335,
          name: '直接访问'
        }, {
          value: 310,
          name: '邮件营销'
        }, {
          value: 234,
          name: '联盟广告'
        }, {
          value: 135,
          name: '视频广告'
        }, {
          value: 1548,
          name: '搜索引擎'
        }],
        itemStyle: {
          emphasis: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }]
    };
    myChart.setOption(option);

    window.onresize = function() {
      myChart.resize();
    };
  }
    exports('main', {}); 
});