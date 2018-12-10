layui.define(['jquery', 'larryms', 'code'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms,
		code = layui.code;
	layui.code({
		skin: 'notepad',
		about: false,
		elem: ".layui-code",
		encode: true
	});
	layui.code({
		about: false,
		elem: ".larry-code",
		encode: true
	});
	//百度echarts
	if (layui.cache.identified == 'echarts') {
		layui.use('echarts', function() {
			var echarts = layui.echarts;
			var demo1 = echarts.init(document.getElementById('demo1'), layui.echartStyle('layui'));
			var options_demo1 = {
				title: {
					text: '某地区蒸发量和降水量',
					subtext: '纯属虚构'
				},
				tooltip: {
					trigger: 'axis'
				},
				legend: {
					data: ['蒸发量', '降水量']
				},
				calculable: true,
				xAxis: [{
					type: 'category',
					data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
					name: '蒸发量',
					type: 'bar',
					data: [2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
					markPoint: {
						data: [{
							type: 'max',
							name: '最大值'
						}, {
							type: 'min',
							name: '最小值'
						}]
					},
					markLine: {
						data: [{
							type: 'average',
							name: '平均值'
						}]
					}
				}, {
					name: '降水量',
					type: 'bar',
					data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
					markPoint: {
						data: [{
							name: '年最高',
							value: 182.2,
							xAxis: 7,
							yAxis: 183,
							symbolSize: 18
						}, {
							name: '年最低',
							value: 2.3,
							xAxis: 11,
							yAxis: 3
						}]
					},
					markLine: {
						data: [{
							type: 'average',
							name: '平均值'
						}]
					}
				}]
			};
			demo1.setOption(options_demo1);

			//面积图
			var options_demo2 = {
				title: {
					text: '某楼盘销售情况',
					subtext: '纯属虚构'
				},
				tooltip: {
					trigger: 'axis'
				},
				legend: {
					data: ['意向', '预购', '成交']
				},
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['line', 'bar', 'stack', 'tiled']
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				calculable: true,
				xAxis: [{
					type: 'category',
					boundaryGap: false,
					data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
					name: '成交',
					type: 'line',
					smooth: true,
					itemStyle: {
						normal: {
							areaStyle: {
								type: 'default'
							}
						}
					},
					data: [10, 12, 21, 54, 260, 830, 710]
				}, {
					name: '预购',
					type: 'line',
					smooth: true,
					itemStyle: {
						normal: {
							areaStyle: {
								type: 'default'
							}
						}
					},
					data: [30, 182, 434, 791, 390, 30, 10]
				}, {
					name: '意向',
					type: 'line',
					smooth: true,
					itemStyle: {
						normal: {
							areaStyle: {
								type: 'default'
							}
						}
					},
					data: [1320, 1132, 601, 234, 120, 90, 20]
				}]
			};
			var demo2 = echarts.init(document.getElementById('demo2'), layui.echartStyle('larry'));
			setTimeout(function() {
				demo2.setOption(options_demo2);
			}, 50);
			//双数值柱形图
			var options_demo3 = {
				title: {
					text: '双数值柱形图',
					subtext: '纯属虚构'
				},
				tooltip: {
					trigger: 'axis',
					axisPointer: {
						show: true,
						type: 'cross',
						lineStyle: {
							type: 'dashed',
							width: 1
						}
					},
					// formatter: function(params) {
					// 	return params.seriesName + ' : [ ' +
					// 		params.value[0] + ', ' +
					// 		params.value[1] + ' ]';
					// }
				},
				legend: {
					data: ['数据1', '数据2']
				},
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['line', 'bar']
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				calculable: true,
				xAxis: [{
					type: 'value'
				}],
				yAxis: [{
					type: 'value',
					axisLine: {
						lineStyle: {
							color: '#dc143c'
						}
					}
				}],
				series: [{
					name: '数据1',
					type: 'bar',
					data: [
						[1.5, 10],
						[5, 7],
						[8, 8],
						[12, 6],
						[11, 12],
						[16, 9],
						[14, 6],
						[17, 4],
						[19, 9]
					],
					markPoint: {
						data: [
							// 纵轴，默认
							{
								type: 'max',
								name: '最大值',
								symbol: 'emptyCircle',
								itemStyle: {
									normal: {
										color: '#dc143c',
										label: {
											position: 'top'
										}
									}
								}
							}, {
								type: 'min',
								name: '最小值',
								symbol: 'emptyCircle',
								itemStyle: {
									normal: {
										color: '#dc143c',
										label: {
											position: 'bottom'
										}
									}
								}
							},
							// 横轴
							{
								type: 'max',
								name: '最大值',
								valueIndex: 0,
								symbol: 'emptyCircle',
								itemStyle: {
									normal: {
										color: '#1e90ff',
										label: {
											position: 'right'
										}
									}
								}
							}, {
								type: 'min',
								name: '最小值',
								valueIndex: 0,
								symbol: 'emptyCircle',
								itemStyle: {
									normal: {
										color: '#1e90ff',
										label: {
											position: 'left'
										}
									}
								}
							}
						]
					},
					markLine: {
						data: [
							// 纵轴，默认
							{
								type: 'max',
								name: '最大值',
								itemStyle: {
									normal: {
										color: '#dc143c'
									}
								}
							}, {
								type: 'min',
								name: '最小值',
								itemStyle: {
									normal: {
										color: '#dc143c'
									}
								}
							}, {
								type: 'average',
								name: '平均值',
								itemStyle: {
									normal: {
										color: '#dc143c'
									}
								}
							},
							// 横轴
							{
								type: 'max',
								name: '最大值',
								valueIndex: 0,
								itemStyle: {
									normal: {
										color: '#1e90ff'
									}
								}
							}, {
								type: 'min',
								name: '最小值',
								valueIndex: 0,
								itemStyle: {
									normal: {
										color: '#1e90ff'
									}
								}
							}, {
								type: 'average',
								name: '平均值',
								valueIndex: 0,
								itemStyle: {
									normal: {
										color: '#1e90ff'
									}
								}
							}
						]
					}
				}, {
					name: '数据2',
					type: 'bar',
					barHeight: 10,
					data: [
						[1, 2],
						[2, 3],
						[4, 4],
						[7, 5],
						[11, 11],
						[18, 15]
					]
				}]
			};
			var demo3 = echarts.init(document.getElementById('demo3'), layui.echartStyle('larry'));
			setTimeout(function() {
				demo3.setOption(options_demo3);
			}, 100);
			//折线图
			var options_demo4 = {
				tooltip: {
					trigger: 'axis'
				},
				legend: {
					left: 'left',
					data: ['邮件营销', '联盟广告', '直接访问', '搜索引擎']
				},
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['line', 'bar', 'stack', 'tiled']
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				calculable: true,
				xAxis: [{
					type: 'category',
					boundaryGap: false,
					data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [{
					name: '邮件营销',
					type: 'line',
					stack: '总量',
					symbol: 'none',
					itemStyle: {
						normal: {
							areaStyle: {
								// 区域图，纵向渐变填充
								// color: (function() {
								// 	var zrColor = require('zrender/tool/color');
								// 	return zrColor.getLinearGradient(
								// 		0, 200, 0, 400, [
								// 			[0, 'rgba(255,0,0,0.8)'],
								// 			[0.8, 'rgba(255,255,255,0.1)']
								// 		]
								// 	)
								// })()
							}
						}
					},
					data: [
						120, 132, 301, 134, {
							value: 90,
							symbol: 'droplet',
							symbolSize: 5
						},
						230, 210
					]
				}, {
					name: '联盟广告',
					type: 'line',
					stack: '总量',
					smooth: true,
					symbol: 'image://../charts/charts.png', // 系列级个性化拐点图形
					symbolSize: 8,
					data: [
						120, 82, {
							value: 201,
							symbol: 'star', // 数据级个性化拐点图形
							symbolSize: 15,
							itemStyle: {
								normal: {
									label: {
										show: true,
										textStyle: {
											fontSize: '20',
											fontFamily: '微软雅黑',
											fontWeight: 'bold'
										}
									}
								}
							}
						}, {
							value: 134,
							symbol: 'none'
						},
						190, {
							value: 230,
							symbol: 'emptypin',
							symbolSize: 8
						},
						110
					]
				}, {
					name: '直接访问',
					type: 'line',
					stack: '总量',
					symbol: 'arrow',
					symbolSize: 6,
					symbolRotate: -45,
					itemStyle: {
						normal: {
							color: 'red',
							lineStyle: { // 系列级个性化折线样式
								width: 2,
								type: 'dashed'
							}
						},
						emphasis: {
							color: 'blue'
						}
					},
					data: [
						320, 332, '-', 334, {
							value: 390,
							symbol: 'star6',
							symbolSize: 20,
							symbolRotate: 10,
							itemStyle: { // 数据级个性化折线样式
								normal: {
									color: 'yellowgreen'
								},
								emphasis: {
									color: 'orange',
									label: {
										show: true,
										position: 'inside',
										textStyle: {
											fontSize: '20'
										}
									}
								}
							}
						},
						330, 320
					]
				}, {
					name: '搜索引擎',
					type: 'line',
					symbol: 'emptyCircle',
					itemStyle: {
						normal: {
							lineStyle: { // 系列级个性化折线样式，横向渐变描边
								width: 2,
								color: (function() {
									// var zrColor = require('zrender/tool/color');
									// return zrColor.getLinearGradient(
									// 	0, 0, 1000, 0, [
									// 		[0, 'rgba(255,0,0,0.8)'],
									// 		[0.8, 'rgba(255,255,0,0.8)']
									// 	]
									// )
								})(),
								shadowColor: 'rgba(0,0,0,0.5)',
								shadowBlur: 10,
								shadowOffsetX: 8,
								shadowOffsetY: 8
							}
						},
						emphasis: {
							label: {
								show: true
							}
						}
					},
					data: [
						620, 732, 791, {
							value: 734,
							symbol: 'emptyHeart',
							symbolSize: 10
						},
						890, 930, 820
					]
				}]
			};
			var demo4 = echarts.init(document.getElementById('demo4'), layui.echartStyle('walden'));

			setTimeout(function() {
				demo4.setOption(options_demo4);
			}, 150);
			//标准饼状图
			var options_demo5 = {
				title: {
					text: '某站点用户访问来源',
					subtext: '纯属虚构',
					x: 'center'
				},
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				legend: {
					orient: 'vertical',
					x: 'left',
					data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎']
				},
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['pie', 'funnel'],
							option: {
								funnel: {
									x: '25%',
									width: '50%',
									funnelAlign: 'left',
									max: 1548
								}
							}
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				calculable: true,
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
					}]
				}]
			};
			var demo5 = echarts.init(document.getElementById('demo5'), layui.echartStyle('wonderland'));

			setTimeout(function() {
				demo5.setOption(options_demo5);
			}, 200);
			//漏斗图
			var options_demo6 = {
				title: {
					text: '漏斗图',
					subtext: '纯属虚构'
				},
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c}%"
				},
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				legend: {
					data: ['展现', '点击', '访问', '咨询', '订单']
				},
				calculable: true,
				series: [{
					name: '漏斗图',
					type: 'funnel',
					width: '40%',
					data: [{
						value: 60,
						name: '访问'
					}, {
						value: 40,
						name: '咨询'
					}, {
						value: 20,
						name: '订单'
					}, {
						value: 80,
						name: '点击'
					}, {
						value: 100,
						name: '展现'
					}]
				}, {
					name: '金字塔',
					type: 'funnel',
					x: '50%',
					sort: 'ascending',
					itemStyle: {
						normal: {
							// color: 各异,
							label: {
								position: 'left'
							}
						}
					},
					data: [{
						value: 60,
						name: '访问'
					}, {
						value: 40,
						name: '咨询'
					}, {
						value: 20,
						name: '订单'
					}, {
						value: 80,
						name: '点击'
					}, {
						value: 100,
						name: '展现'
					}]
				}]
			};
			var demo6 = echarts.init(document.getElementById('demo6'), layui.echartStyle('layui'));

			setTimeout(function() {
				demo6.setOption(options_demo6);
			}, 250);
			//混搭地图
			var options_demo7 = {
				title: {
					text: '2018年上半年上证指数'
				},
				tooltip: {
					trigger: 'axis',
					formatter: function(params) {
						var res = params[0].seriesName + ' ' + params[0].name;
						res += '<br/>  开盘 : ' + params[0].value[0] + '  最高 : ' + params[0].value[3];
						res += '<br/>  收盘 : ' + params[0].value[1] + '  最低 : ' + params[0].value[2];
						return res;
					}
				},
				legend: {
					data: ['上证指数']
				},
				toolbox: {
					show: true,
					feature: {
						mark: {
							show: true
						},
						dataZoom: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['line', 'bar']
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				dataZoom: {
					show: true,
					realtime: true,
					start: 50,
					end: 100
				},
				xAxis: [{
					type: 'category',
					boundaryGap: true,
					axisTick: {
						onGap: false
					},
					splitLine: {
						show: false
					},
					data: [
						"2018/1/24", "2018/1/25", "2018/1/28", "2018/1/29", "2018/1/30",
						"2018/1/31", "2018/2/1", "2018/2/4", "2018/2/5", "2018/2/6",
						"2018/2/7", "2018/2/8", "2018/2/18", "2018/2/19", "2018/2/20",
						"2018/2/21", "2018/2/22", "2018/2/25", "2018/2/26", "2018/2/27",
						"2018/2/28", "2018/3/1", "2018/3/4", "2018/3/5", "2018/3/6",
						"2018/3/7", "2018/3/8", "2018/3/11", "2018/3/12", "2018/3/13",
						"2018/3/14", "2018/3/15", "2018/3/18", "2018/3/19", "2018/3/20",
						"2018/3/21", "2018/3/22", "2018/3/25", "2018/3/26", "2018/3/27",
						"2018/3/28", "2018/3/29", "2018/4/1", "2018/4/2", "2018/4/3",
						"2018/4/8", "2018/4/9", "2018/4/10", "2018/4/11", "2018/4/12",
						"2018/4/15", "2018/4/16", "2018/4/17", "2018/4/18", "2018/4/19",
						"2018/4/22", "2018/4/23", "2018/4/24", "2018/4/25", "2018/4/26",
						"2018/5/2", "2018/5/3", "2018/5/6", "2018/5/7", "2018/5/8",
						"2018/5/9", "2018/5/10", "2018/5/13", "2018/5/14", "2018/5/15",
						"2018/5/16", "2018/5/17", "2018/5/20", "2018/5/21", "2018/5/22",
						"2018/5/23", "2018/5/24", "2018/5/27", "2018/5/28", "2018/5/29",
						"2018/5/30", "2018/5/31", "2018/6/3", "2018/6/4", "2018/6/5",
						"2018/6/6", "2018/6/7", "2018/6/13"
					]
				}],
				yAxis: [{
					type: 'value',
					scale: true,
					boundaryGap: [0.01, 0.01]
				}],
				series: [{
					name: '上证指数',
					type: 'k',
					data: [ // 开盘，收盘，最低，最高
						[2320.26, 2302.6, 2287.3, 2362.94],
						[2300, 2291.3, 2288.26, 2308.38],
						[2295.35, 2346.5, 2295.35, 2346.92],
						[2347.22, 2358.98, 2337.35, 2363.8],
						[2360.75, 2382.48, 2347.89, 2383.76],
						[2383.43, 2385.42, 2371.23, 2391.82],
						[2377.41, 2419.02, 2369.57, 2421.15],
						[2425.92, 2428.15, 2417.58, 2440.38],
						[2411, 2433.13, 2403.3, 2437.42],
						[2432.68, 2434.48, 2427.7, 2441.73],
						[2430.69, 2418.53, 2394.22, 2433.89],
						[2416.62, 2432.4, 2414.4, 2443.03],
						[2441.91, 2421.56, 2415.43, 2444.8],
						[2420.26, 2382.91, 2373.53, 2427.07],
						[2383.49, 2397.18, 2370.61, 2397.94],
						[2378.82, 2325.95, 2309.17, 2378.82],
						[2322.94, 2314.16, 2308.76, 2330.88],
						[2320.62, 2325.82, 2315.01, 2338.78],
						[2313.74, 2293.34, 2289.89, 2340.71],
						[2297.77, 2313.22, 2292.03, 2324.63],
						[2322.32, 2365.59, 2308.92, 2366.16],
						[2364.54, 2359.51, 2330.86, 2369.65],
						[2332.08, 2273.4, 2259.25, 2333.54],
						[2274.81, 2326.31, 2270.1, 2328.14],
						[2333.61, 2347.18, 2321.6, 2351.44],
						[2340.44, 2324.29, 2304.27, 2352.02],
						[2326.42, 2318.61, 2314.59, 2333.67],
						[2314.68, 2310.59, 2296.58, 2320.96],
						[2309.16, 2286.6, 2264.83, 2333.29],
						[2282.17, 2263.97, 2253.25, 2286.33],
						[2255.77, 2270.28, 2253.31, 2276.22],
						[2269.31, 2278.4, 2250, 2312.08],
						[2267.29, 2240.02, 2239.21, 2276.05],
						[2244.26, 2257.43, 2232.02, 2261.31],
						[2257.74, 2317.37, 2257.42, 2317.86],
						[2318.21, 2324.24, 2311.6, 2330.81],
						[2321.4, 2328.28, 2314.97, 2332],
						[2334.74, 2326.72, 2319.91, 2344.89],
						[2318.58, 2297.67, 2281.12, 2319.99],
						[2299.38, 2301.26, 2289, 2323.48],
						[2273.55, 2236.3, 2232.91, 2273.55],
						[2238.49, 2236.62, 2228.81, 2246.87],
						[2229.46, 2234.4, 2227.31, 2243.95],
						[2234.9, 2227.74, 2220.44, 2253.42],
						[2232.69, 2225.29, 2217.25, 2241.34],
						[2196.24, 2211.59, 2180.67, 2212.59],
						[2215.47, 2225.77, 2215.47, 2234.73],
						[2224.93, 2226.13, 2212.56, 2233.04],
						[2236.98, 2219.55, 2217.26, 2242.48],
						[2218.09, 2206.78, 2204.44, 2226.26],
						[2199.91, 2181.94, 2177.39, 2204.99],
						[2169.63, 2194.85, 2165.78, 2196.43],
						[2195.03, 2193.8, 2178.47, 2197.51],
						[2181.82, 2197.6, 2175.44, 2206.03],
						[2201.12, 2244.64, 2200.58, 2250.11],
						[2236.4, 2242.17, 2232.26, 2245.12],
						[2242.62, 2184.54, 2182.81, 2242.62],
						[2187.35, 2218.32, 2184.11, 2226.12],
						[2213.19, 2199.31, 2191.85, 2224.63],
						[2203.89, 2177.91, 2173.86, 2210.58],
						[2170.78, 2174.12, 2161.14, 2179.65],
						[2179.05, 2205.5, 2179.05, 2222.81],
						[2212.5, 2231.17, 2212.5, 2236.07],
						[2227.86, 2235.57, 2219.44, 2240.26],
						[2242.39, 2246.3, 2235.42, 2255.21],
						[2246.96, 2232.97, 2221.38, 2247.86],
						[2228.82, 2246.83, 2225.81, 2247.67],
						[2247.68, 2241.92, 2231.36, 2250.85],
						[2238.9, 2217.01, 2205.87, 2239.93],
						[2217.09, 2224.8, 2213.58, 2225.19],
						[2221.34, 2251.81, 2210.77, 2252.87],
						[2249.81, 2282.87, 2248.41, 2288.09],
						[2286.33, 2299.99, 2281.9, 2309.39],
						[2297.11, 2305.11, 2290.12, 2305.3],
						[2303.75, 2302.4, 2292.43, 2314.18],
						[2293.81, 2275.67, 2274.1, 2304.95],
						[2281.45, 2288.53, 2270.25, 2292.59],
						[2286.66, 2293.08, 2283.94, 2301.7],
						[2293.4, 2321.32, 2281.47, 2322.1],
						[2323.54, 2324.02, 2321.17, 2334.33],
						[2316.25, 2317.75, 2310.49, 2325.72],
						[2320.74, 2300.59, 2299.37, 2325.53],
						[2300.21, 2299.25, 2294.11, 2313.43],
						[2297.1, 2272.42, 2264.76, 2297.1],
						[2270.71, 2270.93, 2260.87, 2276.86],
						[2264.43, 2242.11, 2240.07, 2266.69],
						[2242.26, 2210.9, 2205.07, 2250.63],
						[2190.1, 2148.35, 2126.22, 2190.1]
					]
				}]
			};


			var demo7 = echarts.init(document.getElementById('demo7'), layui.echartStyle('layui'));

			setTimeout(function() {
				demo7.setOption(options_demo7);
			}, 300);
			//多图联动
			var options_demo8 = {
				tooltip: {
					trigger: 'axis'
				},
				toolbox: {
					show: true,
					y: 'bottom',
					feature: {
						mark: {
							show: true
						},
						dataView: {
							show: true,
							readOnly: false
						},
						magicType: {
							show: true,
							type: ['line', 'bar', 'stack', 'tiled']
						},
						restore: {
							show: true
						},
						saveAsImage: {
							show: true
						}
					}
				},
				calculable: true,
				legend: {
					data: ['直接访问', '邮件营销', '联盟广告', '视频广告', '搜索引擎', '百度', '谷歌', '必应', '其他']
				},
				xAxis: [{
					type: 'category',
					splitLine: {
						show: false
					},
					data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
				}],
				yAxis: [{
					type: 'value',
					position: 'right'
				}],
				series: [{
						name: '直接访问',
						type: 'bar',
						data: [320, 332, 301, 334, 390, 330, 320]
					}, {
						name: '邮件营销',
						type: 'bar',
						tooltip: {
							trigger: 'item'
						},
						stack: '广告',
						data: [120, 132, 101, 134, 90, 230, 210]
					}, {
						name: '联盟广告',
						type: 'bar',
						tooltip: {
							trigger: 'item'
						},
						stack: '广告',
						data: [220, 182, 191, 234, 290, 330, 310]
					}, {
						name: '视频广告',
						type: 'bar',
						tooltip: {
							trigger: 'item'
						},
						stack: '广告',
						data: [150, 232, 201, 154, 190, 330, 410]
					}, {
						name: '搜索引擎',
						type: 'line',
						data: [862, 1018, 964, 1026, 1679, 1600, 1570]
					},

					{
						name: '搜索引擎细分',
						type: 'pie',
						tooltip: {
							trigger: 'item',
							formatter: '{a} <br/>{b} : {c} ({d}%)'
						},
						center: [160, 130],
						radius: [0, 50],
						itemStyle: 　{
							normal: {
								labelLine: {
									length: 20
								}
							}
						},
						data: [{
							value: 1048,
							name: '百度'
						}, {
							value: 251,
							name: '谷歌'
						}, {
							value: 147,
							name: '必应'
						}, {
							value: 102,
							name: '其他'
						}]
					}
				]
			};

			var demo8 = echarts.init(document.getElementById('demo8'), layui.echartStyle('larry'));

			setTimeout(function() {
				demo8.setOption(options_demo8);
			}, 350);
			//混搭
			var dataBJ = [
				[1, 55, 9, 56, 0.46, 18, 6, "良"],
				[2, 25, 11, 21, 0.65, 34, 9, "优"],
				[3, 56, 7, 63, 0.3, 14, 5, "良"],
				[4, 33, 7, 29, 0.33, 16, 6, "优"],
				[5, 42, 24, 44, 0.76, 40, 16, "优"],
				[6, 82, 58, 90, 1.77, 68, 33, "良"],
				[7, 74, 49, 77, 1.46, 48, 27, "良"],
				[8, 78, 55, 80, 1.29, 59, 29, "良"],
				[9, 267, 216, 280, 4.8, 108, 64, "重度污染"],
				[10, 185, 127, 216, 2.52, 61, 27, "中度污染"],
				[11, 39, 19, 38, 0.57, 31, 15, "优"],
				[12, 41, 11, 40, 0.43, 21, 7, "优"],
				[13, 64, 38, 74, 1.04, 46, 22, "良"],
				[14, 108, 79, 120, 1.7, 75, 41, "轻度污染"],
				[15, 108, 63, 116, 1.48, 44, 26, "轻度污染"],
				[16, 33, 6, 29, 0.34, 13, 5, "优"],
				[17, 94, 66, 110, 1.54, 62, 31, "良"],
				[18, 186, 142, 192, 3.88, 93, 79, "中度污染"],
				[19, 57, 31, 54, 0.96, 32, 14, "良"],
				[20, 22, 8, 17, 0.48, 23, 10, "优"],
				[21, 39, 15, 36, 0.61, 29, 13, "优"],
				[22, 94, 69, 114, 2.08, 73, 39, "良"],
				[23, 99, 73, 110, 2.43, 76, 48, "良"],
				[24, 31, 12, 30, 0.5, 32, 16, "优"],
				[25, 42, 27, 43, 1, 53, 22, "优"],
				[26, 154, 117, 157, 3.05, 92, 58, "中度污染"],
				[27, 234, 185, 230, 4.09, 123, 69, "重度污染"],
				[28, 160, 120, 186, 2.77, 91, 50, "中度污染"],
				[29, 134, 96, 165, 2.76, 83, 41, "轻度污染"],
				[30, 52, 24, 60, 1.03, 50, 21, "良"],
				[31, 46, 5, 49, 0.28, 10, 6, "优"]
			];

			var dataGZ = [
				[1, 26, 37, 27, 1.163, 27, 13, "优"],
				[2, 85, 62, 71, 1.195, 60, 8, "良"],
				[3, 78, 38, 74, 1.363, 37, 7, "良"],
				[4, 21, 21, 36, 0.634, 40, 9, "优"],
				[5, 41, 42, 46, 0.915, 81, 13, "优"],
				[6, 56, 52, 69, 1.067, 92, 16, "良"],
				[7, 64, 30, 28, 0.924, 51, 2, "良"],
				[8, 55, 48, 74, 1.236, 75, 26, "良"],
				[9, 76, 85, 113, 1.237, 114, 27, "良"],
				[10, 91, 81, 104, 1.041, 56, 40, "良"],
				[11, 84, 39, 60, 0.964, 25, 11, "良"],
				[12, 64, 51, 101, 0.862, 58, 23, "良"],
				[13, 70, 69, 120, 1.198, 65, 36, "良"],
				[14, 77, 105, 178, 2.549, 64, 16, "良"],
				[15, 109, 68, 87, 0.996, 74, 29, "轻度污染"],
				[16, 73, 68, 97, 0.905, 51, 34, "良"],
				[17, 54, 27, 47, 0.592, 53, 12, "良"],
				[18, 51, 61, 97, 0.811, 65, 19, "良"],
				[19, 91, 71, 121, 1.374, 43, 18, "良"],
				[20, 73, 102, 182, 2.787, 44, 19, "良"],
				[21, 73, 50, 76, 0.717, 31, 20, "良"],
				[22, 84, 94, 140, 2.238, 68, 18, "良"],
				[23, 93, 77, 104, 1.165, 53, 7, "良"],
				[24, 99, 130, 227, 3.97, 55, 15, "良"],
				[25, 146, 84, 139, 1.094, 40, 17, "轻度污染"],
				[26, 113, 108, 137, 1.481, 48, 15, "轻度污染"],
				[27, 81, 48, 62, 1.619, 26, 3, "良"],
				[28, 56, 48, 68, 1.336, 37, 9, "良"],
				[29, 82, 92, 174, 3.29, 0, 13, "良"],
				[30, 106, 116, 188, 3.628, 101, 16, "轻度污染"],
				[31, 118, 50, 0, 1.383, 76, 11, "轻度污染"]
			];

			var dataSH = [
				[1, 91, 45, 125, 0.82, 34, 23, "良"],
				[2, 65, 27, 78, 0.86, 45, 29, "良"],
				[3, 83, 60, 84, 1.09, 73, 27, "良"],
				[4, 109, 81, 121, 1.28, 68, 51, "轻度污染"],
				[5, 106, 77, 114, 1.07, 55, 51, "轻度污染"],
				[6, 109, 81, 121, 1.28, 68, 51, "轻度污染"],
				[7, 106, 77, 114, 1.07, 55, 51, "轻度污染"],
				[8, 89, 65, 78, 0.86, 51, 26, "良"],
				[9, 53, 33, 47, 0.64, 50, 17, "良"],
				[10, 80, 55, 80, 1.01, 75, 24, "良"],
				[11, 117, 81, 124, 1.03, 45, 24, "轻度污染"],
				[12, 99, 71, 142, 1.1, 62, 42, "良"],
				[13, 95, 69, 130, 1.28, 74, 50, "良"],
				[14, 116, 87, 131, 1.47, 84, 40, "轻度污染"],
				[15, 108, 80, 121, 1.3, 85, 37, "轻度污染"],
				[16, 134, 83, 167, 1.16, 57, 43, "轻度污染"],
				[17, 79, 43, 107, 1.05, 59, 37, "良"],
				[18, 71, 46, 89, 0.86, 64, 25, "良"],
				[19, 97, 71, 113, 1.17, 88, 31, "良"],
				[20, 84, 57, 91, 0.85, 55, 31, "良"],
				[21, 87, 63, 101, 0.9, 56, 41, "良"],
				[22, 104, 77, 119, 1.09, 73, 48, "轻度污染"],
				[23, 87, 62, 100, 1, 72, 28, "良"],
				[24, 168, 128, 172, 1.49, 97, 56, "中度污染"],
				[25, 65, 45, 51, 0.74, 39, 17, "良"],
				[26, 39, 24, 38, 0.61, 47, 17, "优"],
				[27, 39, 24, 39, 0.59, 50, 19, "优"],
				[28, 93, 68, 96, 1.05, 79, 29, "良"],
				[29, 188, 143, 197, 1.66, 99, 51, "中度污染"],
				[30, 174, 131, 174, 1.55, 108, 50, "中度污染"],
				[31, 187, 143, 201, 1.39, 89, 53, "中度污染"]
			];

			var schema = [{
				name: 'date',
				index: 0,
				text: '日'
			}, {
				name: 'AQIindex',
				index: 1,
				text: 'AQI指数'
			}, {
				name: 'PM25',
				index: 2,
				text: 'PM2.5'
			}, {
				name: 'PM10',
				index: 3,
				text: 'PM10'
			}, {
				name: 'CO',
				index: 4,
				text: '一氧化碳（CO）'
			}, {
				name: 'NO2',
				index: 5,
				text: '二氧化氮（NO2）'
			}, {
				name: 'SO2',
				index: 6,
				text: '二氧化硫（SO2）'
			}];


			var itemStyle = {
				normal: {
					opacity: 0.8,
					shadowBlur: 10,
					shadowOffsetX: 0,
					shadowOffsetY: 0,
					shadowColor: 'rgba(0, 0, 0, 0.5)'
				}
			};

			var options_demo9 = {
				// backgroundColor: '#404a59',
				color: [
					'#dd4444', '#fec42c', '#80F1BE'
				],
				legend: {
					y: '15px',
					data: ['北京', '上海', '广州'],
					textStyle: {
						color: '#fff',
						fontSize: 14
					}
				},
				grid: {
					x: '10%',
					x2: 150,
					y: '18%',
					y2: '10%'
				},
				tooltip: {
					padding: 10,
					backgroundColor: '#222',
					borderColor: '#777',
					borderWidth: 1,
					formatter: function(obj) {
						var value = obj.value;
						return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">' +
							obj.seriesName + ' ' + value[0] + '日：' +
							value[7] +
							'</div>' +
							schema[1].text + '：' + value[1] + '<br>' +
							schema[2].text + '：' + value[2] + '<br>' +
							schema[3].text + '：' + value[3] + '<br>' +
							schema[4].text + '：' + value[4] + '<br>' +
							schema[5].text + '：' + value[5] + '<br>' +
							schema[6].text + '：' + value[6] + '<br>';
					}
				},
				xAxis: {
					type: 'value',
					name: '日期',
					nameGap: 16,
					nameTextStyle: {
						color: '#fff',
						fontSize: 14
					},
					max: 31,
					splitLine: {
						show: false
					},
					axisLine: {
						lineStyle: {
							color: '#eee'
						}
					}
				},
				yAxis: {
					type: 'value',
					name: 'AQI指数',
					nameLocation: 'end',
					nameGap: 20,
					nameTextStyle: {
						color: '#fff',
						fontSize: 14
					},
					axisLine: {
						lineStyle: {
							color: '#eee'
						}
					},
					splitLine: {
						show: false
					}
				},
				visualMap: [{
					left: 'right',
					top: '6%',
					dimension: 2,
					min: 0,
					max: 250,
					itemWidth: 30,
					itemHeight: 120,
					calculable: true,
					precision: 0.1,
					text: ['圆形大小：PM2.5'],
					textGap: 30,
					textStyle: {
						color: '#fff'
					},
					inRange: {
						symbolSize: [10, 70]
					},
					outOfRange: {
						symbolSize: [10, 70],
						color: ['rgba(255,255,255,.2)']
					},
					controller: {
						inRange: {
							color: ['#c23531']
						},
						outOfRange: {
							color: ['#444']
						}
					}
				}, {
					left: 'right',
					bottom: '5%',
					dimension: 6,
					min: 0,
					max: 50,
					itemHeight: 100,
					calculable: true,
					precision: 0.1,
					text: ['明暗：二氧化硫'],
					textGap: 30,
					textStyle: {
						color: '#fff'
					},
					inRange: {
						colorLightness: [1, 0.5]
					},
					outOfRange: {
						color: ['rgba(255,255,255,.2)']
					},
					controller: {
						inRange: {
							color: ['#c23531']
						},
						outOfRange: {
							color: ['#444']
						}
					}
				}],
				series: [{
					name: '北京',
					type: 'scatter',
					itemStyle: itemStyle,
					data: dataBJ
				}, {
					name: '上海',
					type: 'scatter',
					itemStyle: itemStyle,
					data: dataSH
				}, {
					name: '广州',
					type: 'scatter',
					itemStyle: itemStyle,
					data: dataGZ
				}]
			};
			var demo9 = echarts.init(document.getElementById('demo9'), layui.echartStyle('chalk'));
			setTimeout(function() {
				demo9.setOption(options_demo9);
			}, 50);
			setTimeout(function() {
				window.onresize = function() {
					demo1.resize();
					demo2.resize();
					demo3.resize();
					demo4.resize();
					demo5.resize();
					demo6.resize();
					demo7.resize();
					demo8.resize();
					demo9.resize();
				};
			}, 200);

		});
	} else if (layui.cache.identified == 'countup') {
		//数字动画组件
		layui.use('countup', function() {
			var countup = layui.countup;
			var one = new countup('one', 0, $('#one').text()),
				two = new countup('two', 0, $('#two').text()),
				three = new countup('three', 0, $('#three').text());
			one.start();
			two.start();
			three.start();

			$('.larryms-countup-box li').on('click', function() {
				var counterId = $(this).children('cite').attr('id');
				var $counter = new countup(counterId, 0, $('#' + counterId).text().replace(/,/g, ''));
				$counter.start();
			});
		});
	} else if (layui.cache.identified == 'intro') {
		layui.use('intro', function() {
			var intro = layui.intro;
			//监听分步动作触发
			$('#introStart').on('click', function() {
				intro().setOption('tooltipPosition', 'auto');
				intro().setOption('positionPrecedence', ['left', 'right', 'top', 'bottom']);
				intro().start();
			});
		});
	} else if (layui.cache.identified == 'svg') {
		layui.use(['svgLoader'], function() {
			var svgLoader = layui.svgLoader;

			$('.larryms-svg .svg-start').on('click', function() {
				var svgID = $(this).parent('ul').siblings('.larryms-svg-id').attr('id');
				//根据ID获取svg执行对象
				var loader = new SVGLoader(document.getElementById(svgID), {
					speedIn: 400,
					easingIn: mina.easeinout
				});

				function init() {
					loader.show();
					setTimeout(function() {
						loader.hide();
					}, 1500);
				}
				init();
			});
		});
	} else if (layui.cache.identified == 'scrolla') {
		layui.use('scrolla', function() {
			var scrolla = layui.scrolla;
			$('.animate').scrolla();
		});
	} else if (layui.cache.identified == 'anijs') {
		layui.use('anijs', function() {
			var anijs = layui.anijs;
			$('#anijs .content').mouseleave(function() {
				var css = $(this).children('.item').attr('class');
				if (css.indexOf('Out')!==-1) {
					$(this).children('.item').removeClass('animated');
				}
			});
		});
	}


	exports('chartsdemo', {});

});