layui.define(['jquery', 'larryms', 'echarts'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms,
		util = layui.util,
		device = layui.device(),
		echarts = layui.echarts;
	larryms.panel();
	$('.versionT').text(larryms.version);
	if(device.ie){
		$('body').addClass('ie-bug');
	}else{
		$('body').removeClass('ie-bug');
	}
	if (layui.cache.identified == 'main') {
		// var $dev = larryms.deviceType();
		// if ($dev.devices == 'mobile') {
		// 	$('#getGrant a').addClass('layui-btn-sm');
		// } else {
		// 	$('#getGrant a').removeClass('layui-btn-sm');
		// }
		// 数据统计
		var myChart = echarts.init(document.getElementById('larryCount'), layui.echartStyle('larry'));
		var options = {
			title: {
				text: '今日流量趋势',
				x: 'center',
				textStyle: {
					fontSize: 14
				}
			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data: ['', '']
			},
			xAxis: [{
				type: 'category',
				boundaryGap: false,
				data: ['06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30']
			}],
			yAxis: [{
				type: 'value'
			}],
			series: [{
				name: 'PV',
				type: 'line',
				smooth: true,
				itemStyle: {
					normal: {
						areaStyle: {
							type: 'default'
						}
					}
				},
				data: [21010, 4444, 1200, 888, 555, 666, 3333, 33333, 55555, 66666, 33333, 3333, 6666, 11888, 11116, 33333, 56666, 42222, 39999, 28888, 17777, 9666, 6555, 5555, 3333, 2222, 3111, 6999, 13333, 26666, 33333, 999, 888, 777]
			}, {
				name: 'UV',
				type: 'line',
				smooth: true,
				itemStyle: {
					normal: {
						areaStyle: {
							type: 'default'
						}
					}
				},
				data: [3333, 555, 33, 44, 55, 66, 333, 3333, 5555, 12666, 3333, 333, 666, 1188, 2666, 3888, 6666, 4222, 3999, 2888, 1777, 966, 655, 555, 333, 222, 311, 699, 888, 2666, 166, 99, 88, 77]
			}]
		};
		myChart.setOption(options);
		window.onresize = function() {
			myChart.resize();
		};
		//移动端体验
		layui.use(['qrcode','countup'], function() {
			var qrcode = layui.qrcode,
				countup = layui.countup,
				url = top.location.href;
			var artNums = new countup('artNums', 0, $('#artNums').text()),
			    msgNums = new countup('msgNums', 0, $('#msgNums').text()),
			    userNums = new countup('userNums', 0, $('#userNums').text());
			artNums.start();
			msgNums.start();
			userNums.start();
			var qrcodes = new qrcode($('#qrcode')[0], {
				width: 300,
				height: 300,
				text: larryms.utf16to8('LarryMS框架'),
				foreground: '#5FB878'
			});
			qrcodes.makeCode(url);
			$('#wapQrcode').on('click', function() {
				var $con = $('#qrcodeBox').html();
				var index = top.layer.open({
					type: 1,
					title: '使用手机扫二维码查看移动端演示',
					skin: 'larry-green',
					area: ['320px', '360px'],
					shadeClose: true,
					shade: 0.6,
					content: $con,
					end: function() {
						layer.closeAll();
					}
				});
			});
			$('#remarkLarryMS').on('click',function(){
				var index = top.layer.open({
					type: 2,
					title: '关于LarryMS预览版说明',
					// skin: 'larry-green',
					area: ['600px', '350px'],
					shadeClose: true,
					shade: 0.6,
					content:'msg.html',
					end: function() {
						layer.closeAll();
					}
				});
			})

		});
	} else if (layui.cache.identified == 'data') {
		var myChart = echarts.init(document.getElementById('larryCount'), layui.echartStyle('chalk'));
		var metterOption = {
			backgroundColor: '#504F88',
			tooltip: {
				formatter: "{a} <br/>{c} {b}"
			},
			toolbox: {
				show: true,
				feature: {
					mark: {
						show: true
					},
					restore: {
						show: true
					},
					saveAsImage: {
						show: true
					}
				}
			},
			series: [{
				name: '带宽',
				type: 'gauge',
				min: 0,
				max: 100,
				splitNumber: 10,
				axisLine: { // 坐标轴线
					lineStyle: { // 属性lineStyle控制线条样式
						color: [
							[0.09, 'lime'],
							[0.82, '#1e90ff'],
							[1, '#ff4500']
						],
						width: 3,
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				axisLabel: { // 坐标轴小标记
					textStyle: { // 属性lineStyle控制线条样式
						fontWeight: 'bolder',
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				axisTick: { // 坐标轴小标记
					length: 15, // 属性length控制线长
					lineStyle: { // 属性lineStyle控制线条样式
						color: 'auto',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				splitLine: { // 分隔线
					length: 25, // 属性length控制线长
					lineStyle: { // 属性lineStyle（详见lineStyle）控制线条样式
						width: 3,
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				pointer: { // 分隔线
					shadowColor: '#fff', //默认透明
					shadowBlur: 5
				},
				title: {
					textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: 'bolder',
						fontSize: 20,
						fontStyle: 'italic',
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				detail: {
					backgroundColor: 'rgba(30,144,255,0.8)',
					borderWidth: 1,
					borderColor: '#fff',
					shadowColor: '#fff', //默认透明
					shadowBlur: 5,
					offsetCenter: [0, '50%'], // x, y，单位px
					textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: 'bolder',
						color: '#fff'
					}
				},
				data: [{
					value: 10,
					name: 'Mb/s'
				}]
			}, {
				name: 'CPU利用率',
				type: 'gauge',
				center: ['15%', '50%'], // 默认全局居中
				radius: '70%',
				min: 0,
				max: 100,
				endAngle: 0,
				splitNumber: 10,
				axisLine: { // 坐标轴线
					lineStyle: { // 属性lineStyle控制线条样式
						color: [
							[0.29, 'lime'],
							[0.86, '#1e90ff'],
							[1, '#ff4500']
						],
						width: 2,
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				axisLabel: { // 坐标轴小标记
					textStyle: { // 属性lineStyle控制线条样式
						fontWeight: 'bolder',
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				axisTick: { // 坐标轴小标记
					length: 12, // 属性length控制线长
					lineStyle: { // 属性lineStyle控制线条样式
						color: 'auto',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				splitLine: { // 分隔线
					length: 20, // 属性length控制线长
					lineStyle: { // 属性lineStyle（详见lineStyle）控制线条样式
						width: 3,
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				pointer: {
					width: 5,
					shadowColor: '#fff', //默认透明
					shadowBlur: 5
				},
				title: {
					offsetCenter: [0, '-30%'], // x, y，单位px
					textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: 'bolder',
						fontStyle: 'italic',
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				detail: {
					// backgroundColor: 'rgba(30,144,255,0.8)',
					// borderWidth: 1,
					borderColor: '#fff',
					shadowColor: '#fff', //默认透明
					shadowBlur: 5,
					width: 80,
					height: 30,
					offsetCenter: [25, '20%'], // x, y，单位px
					textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: 'bolder',
						color: '#fff'
					},
					formatter: '{value}%'
				},
				data: [{
					value: 1.5,
					name: 'CPU'
				}]
			}, {
				name: '业务指标',
				type: 'gauge',
				center: ['85%', '55%'], // 默认全局居中
				radius: '75%',
				tooltip: {
					formatter: "{a} <br/>{b} : {c}%"
				},
				toolbox: {
					feature: {
						restore: {},
						saveAsImage: {}
					}
				},
				title: {
					offsetCenter: [0, '-30%'], // x, y，单位px
					textStyle: { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
						fontWeight: 'bolder',
						color: '#fff',
						shadowColor: '#fff', //默认透明
						shadowBlur: 10
					}
				},
				detail: {
					// formatter: '{value}%'
				},
				data: [{
					value: 50,
					name: '完成率'
				}]
			}]
		};
		clearInterval(timeTicket);
		var timeTicket = setInterval(function() {
			metterOption.series[0].data[0].value = (Math.random() * 50).toFixed(2) - 0;
			metterOption.series[1].data[0].value = (Math.random() * 30).toFixed(2) - 0;
			metterOption.series[2].data[0].value = (Math.random() * 30).toFixed(2) - 0;
			myChart.setOption(metterOption, true);
		}, 2000)
		myChart.setOption(metterOption);
		//引入流量统计
		var myCharty = echarts.init(document.getElementById('mounths'), layui.echartStyle('larry'));
		var myChartw = echarts.init(document.getElementById('weath'), layui.echartStyle('larry'));
		var optionsy = {
				title: {
					text: '本月流量趋势',
					x: 'center',
					textStyle: {
						fontSize: 14
					}
				},
				tooltip: {
					trigger: 'axis'
				},
				legend: {
					data: ['', '']
				},
				xAxis: [{
					type: 'category',
					boundaryGap: false,
					data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31']
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
					name: 'PV',
					type: 'line',
					smooth: true,
					itemStyle: {
						normal: {
							areaStyle: {
								type: 'default'
							}
						}
					},
					data: [80000, 44440, 1200, 60000, 55554, 8888, 33376, 7777, 88898, 66665, 33333, 3333, 6666, 11888, 11116, 33333, 56666, 42222, 39999, 28888, 17777, 9666, 6555, 5555, 3333, 2222, 3111, 6999, 13333, 26666, 33333]
				}, {
					name: 'UV',
					type: 'line',
					smooth: true,
					itemStyle: {
						normal: {
							areaStyle: {
								type: 'default'
							}
						}
					},
					data: [33330, 1766, 555, 6888, 5555, 5555, 4444, 3333, 5555, 42666, 3333, 333, 666, 1188, 2666, 3888, 6666, 4222, 3999, 2888, 1777, 966, 655, 555, 333, 222, 311, 699, 888, 2666, 166]
				}]
			},
			optionsw = {
				title: {
					text: '本周流量趋势',
					x: '10%',
					textStyle: {
						fontSize: 14
					}
				},
				tooltip: {
					trigger: 'axis'
				},
				legend: {
					data: ['PV', 'UV']
				},
				grid: {
					left: '8%',
					right: '4%',
					bottom: '3%',
					containLabel: true
				},
				toolbox: {
					feature: {
						saveAsImage: {}
					}
				},
				xAxis: [{
					type: 'category',
					boundaryGap: false,
					data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
					name: 'PV',
					type: 'line',

					data: [10000, 30003, 8000, 26000, 55000, 3000, 43000]
				}, {
					name: 'UV',
					type: 'line',

					data: [1000, 6802, 500, 9000, 6000, 100, 12000]
				}]
			};
		var myChartd = echarts.init(document.getElementById('day'), layui.echartStyle('walden'));
		var optionsd = {
			title: {
				text: '今日流量趋势',
				x: 'center',
				textStyle: {
					fontSize: 14
				}
			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data: ['', '']
			},
			xAxis: [{
				type: 'category',
				boundaryGap: false,
				data: ['06:00', '06:30', '07:00', '07:30', '08:00', '08:30', '09:00', '09:30', '10:00', '11:30', '12:00', '12:30', '13:00', '13:30', '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00', '17:30', '18:00', '18:30', '19:00', '19:30', '20:00', '20:30', '21:00', '21:30', '22:00', '22:30', '23:00', '23:30']
			}],
			yAxis: [{
				type: 'value'
			}],
			series: [{
				name: 'PV',
				type: 'line',
				smooth: true,
				itemStyle: {
					normal: {
						areaStyle: {
							type: 'default'
						}
					}
				},
				data: [21010, 4444, 1200, 888, 555, 666, 3333, 33333, 55555, 66666, 33333, 3333, 6666, 11888, 11116, 33333, 56666, 42222, 39999, 28888, 17777, 9666, 6555, 5555, 3333, 2222, 3111, 6999, 13333, 26666, 33333, 999, 888, 777]
			}, {
				name: 'UV',
				type: 'line',
				smooth: true,
				itemStyle: {
					normal: {
						areaStyle: {
							type: 'default'
						}
					}
				},
				data: [3333, 555, 33, 44, 55, 66, 333, 3333, 5555, 12666, 3333, 333, 666, 1188, 2666, 3888, 6666, 4222, 3999, 2888, 1777, 966, 655, 555, 333, 222, 311, 699, 888, 2666, 166, 99, 88, 77]
			}]
		};
		var myChartllq = echarts.init(document.getElementById('counts'), layui.echartStyle('larry'));
		var explorer = {
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
				data: ['Chrome', 'Firefox', 'IE', '百度', '360', 'QQ浏览器']
			},
			series: [{
				name: '访问来源',
				type: 'pie',
				radius: '43%',
				center: ['55%', '72%'],
				data: [{
					value: 6036,
					name: 'Chrome'
				}, {
					value: 3566,
					name: 'Firefox'
				}, {
					value: 3001,
					name: 'IE'
				}, {
					value: 1560,
					name: '百度'
				}, {
					value: 1236,
					name: '360'
				}, {
					value: 900,
					name: 'QQ浏览器'
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
		myCharty.setOption(optionsy);
		myChartw.setOption(optionsw);
		myChartd.setOption(optionsd);
		myChartllq.setOption(explorer);

		window.onresize = function() {
			myChart.resize();
			myCharty.resize();
			myChartw.resize();
			myChartd.resize();
			myChartllq.resize();
		};
	} else if (layui.cache.identified == 'general') {

		option = {
			legend: {},
			title: {
				text: '（ 5、6、7、8月份汇总 ）',
				x: 'center',
				y: '90%',
				textStyle: {
					fontSize: 14
				}
			},
			tooltip: {},
			dataset: {
				source: [
					['product', '5月', '6月', '7月', '8月'],
					['线上', 41.1, 30.4, 65.1, 53.3],
					['线下', 86.5, 92.1, 85.7, 83.1],
					['品牌', 24.1, 67.2, 79.5, 86.4]
				]
			},
			xAxis: [{
				type: 'category'
			}],
			yAxis: [{}],
			grid: [{
				bottom: '20%'
			}, {
				top: '55%'
			}],
			series: [{
				type: 'bar',
				seriesLayoutBy: 'row'
			}, {
				type: 'bar',
				seriesLayoutBy: 'row'
			}, {
				type: 'bar',
				seriesLayoutBy: 'row'
			}, ]
		};
		var myChart = echarts.init(document.getElementById('icome'), layui.echartStyle('layui'));
		myChart.setOption(option);
		window.onresize = function() {
			myChart.resize();
		};
		//历史订单
		layui.use(['countup', 'table'], function() {
			var countup = layui.countup,
				table = layui.table;
			var UVc = new countup('UVcounter', 0, $('#UVcounter').text());
			var incomec = new countup('incomeCounter', 0, $('#incomeCounter').text());
			var orderc = new countup('orderCounter', 0, $('#orderCounter').text());
			var userc = new countup('userCounter', 0, $('#userCounter').text());
			orderc.start();
			incomec.start();
			UVc.start();
			userc.start();
			$('.countup').on('click', function() {
				var counterId = $(this).children('.right').children('.p').children('h3').attr('id');
				var $counter = new countup(counterId, 0, $('#' + counterId).text().replace(/,/g, ''));
				$counter.start();
			});
			var url = $('#historyOrder').data('url'),
				orderIns = table.render({
					elem: '#historyOrder',
					id: "historyOrder",
					cellMinWidth: 95,
					url: url,
					method: 'post',
					height: "530",
					page: true,
					limits: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
					limit: 10,
					cols: [
						[{
							type: "checkbox",
							fixed: 'left',
							width: 40
						}, {
							field: 'order_id',
							title: '订单号',
							minWidth: 80,
							align: 'center'
						}, {
							field: 'names',
							title: '产品名称',
							minWidth: 70,
							align: 'center'
						}, {
							field: 'sum',
							title: '金额',
							minWidth: 70,
							align: 'center'
						}, {
							field: 'status',
							title: '交易状态',
							minWidth: 90,
							align: 'center',
							templet: function(d) {
								if (d.status == '1') {
									return '<input type="checkbox" name="zzz" lay-skin="switch" lay-text="成功|失败" checked>';
								} else {
									return '<input type="checkbox" name="zzz" lay-skin="switch" lay-text="成功|失败">';
								}
							}
						}, {
							field: 'time',
							title: '交易时间',
							minWidth: 80,
							align: 'center'
						}]
					]
				});
			larryms.photos({
				photos: '#larrymsDynamicPic',
			});
		});
	}

	exports('console', {});
});