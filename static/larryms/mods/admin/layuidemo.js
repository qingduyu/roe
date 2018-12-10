layui.define(['jquery', 'code', 'element', 'slider', 'rate'], function(exports) {
	var $ = layui.$,
		element = layui.element,
		slider = layui.slider,
		rate = layui.rate,
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
	if (layui.cache.identified == 'auxs') {
		//触发事件
		var active = {
			setPercent: function() {
				//设置50%进度
				element.progress('demo', '50%')
			},
			loading: function(othis) {
				var DISABLED = 'layui-btn-disabled';
				if (othis.hasClass(DISABLED)) return;

				//模拟loading
				var n = 0,
					timer = setInterval(function() {
						n = n + Math.random() * 10 | 0;
						if (n > 100) {
							n = 100;
							clearInterval(timer);
							othis.removeClass(DISABLED);
						}
						element.progress('demo', n + '%');
					}, 300 + Math.random() * 1000);

				othis.addClass(DISABLED);
			}
		};
		$('.site-demo-active').on('click', function() {
			var othis = $(this),
				type = $(this).data('type');
			active[type] ? active[type].call(this, othis) : '';
		});
		//默认滑块
		slider.render({
			elem: '#slideTest1'
		});
		//定义初始值
		slider.render({
			elem: '#slideTest2',
			value: 30 //初始值
		});
		//设置最大最小值
		slider.render({
			elem: '#slideTest3',
			min: 30, //最小值
			max: 60 //最大值
		});

		//自定义颜色
		slider.render({
			elem: '#slideTest15',
			theme: '#1E9FFF', //主题色
			value: 25 //初始值
				,
			setTips: function(value) { //自定义提示文本
				return value + ' 这里可自定义文本提示内容';
			}
		});
		slider.render({
			elem: '#slideTest16',
			value: 50,
			theme: '#5FB878' //主题色
				,
			step: 10 //步长
				,
			showstep: true //开启间隔点
		});
		slider.render({
			elem: '#slideTest17',
			value: [30, 70],
			range: true,
			theme: '#FF5722' //主题色
		});
		//开启输入框
		slider.render({
			elem: '#slideTest8',
			input: true //输入框
		});

		//开启范围选择
		slider.render({
			elem: '#slideTest9',
			value: 40 //初始值
				,
			range: true //范围选择
				,
			change: function(vals) {
				$('#test-slider-tips2').html('开始值：' + vals[0] + '、结尾值：' + vals[1]);
			}
		});
		slider.render({
			elem: '#slideTest18',
			value: 35,
			disabled: true //禁用滑块
		});
		//垂直滑块
		slider.render({
			elem: '#slideTest11',
			type: 'vertical' //垂直滑块
		});
		slider.render({
			elem: '#slideTest12',
			value: 30,
			type: 'vertical' //垂直滑块
		});
		slider.render({
			elem: '#slideTest13',
			value: 50,
			range: true //范围选择
				,
			type: 'vertical' //垂直滑块
		});
		slider.render({
			elem: '#slideTest14',
			value: 80,
			type: 'vertical' //垂直滑块
		});
		//主题色
		rate.render({
			elem: '#test10',
			value: 3,
			length: 10,
			theme: '#FF8000' //自定义主题色
		});
		rate.render({
			elem: '#test11',
			value: 6,
			length: 10,
			theme: '#009688'
		});

		rate.render({
			elem: '#test12',
			value: 8.5,
			half: true,
			length: 10,
			theme: '#1E9FFF'
		})
		rate.render({
			elem: '#test13',
			value: 4.5,
			half: true,
			length: 10,
			theme: '#2F4056'
		});
		rate.render({
			elem: '#test14',
			value: 2.5,
			half: true,
			length: 10,
			theme: '#FE0000'
		});
	} else if (layui.cache.identified == 'forms') {
		layui.use(['form', 'layedit', 'laydate'], function() {
			var form = layui.form,
				layer = layui.layer,
				layedit = layui.layedit,
				laydate = layui.laydate;

			//日期
			laydate.render({
				elem: '#date'
			});
			laydate.render({
				elem: '#date1'
			});

			//创建一个编辑器
			var editIndex = layedit.build('LAY_demo_editor');

			//自定义验证规则
			form.verify({
				title: function(value) {
					if (value.length < 5) {
						return '标题至少得5个字符啊';
					}
				},
				pass: [/(.+){6,12}$/, '密码必须6到12位'],
				content: function(value) {
					layedit.sync(editIndex);
				}
			});

			//监听指定开关
			form.on('switch(switchTest)', function(data) {
				layer.msg('开关checked：' + (this.checked ? 'true' : 'false'), {
					offset: '6px'
				});
				layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
			});

			//监听提交
			form.on('submit(demo1)', function(data) {
				layer.alert(JSON.stringify(data.field), {
					title: '最终的提交信息'
				})
				return false;
			});

			//表单初始赋值
			form.val('example', {
				"username": "layui" // "name": "value"
					,
				"password": "123456",
				"interest": 1,
				"like[write]": true //复选框选中状态
					,
				"close": true //开关状态
					,
				"sex": "女",
				"desc": "我爱 layui"
			})
		});
	} else if (layui.cache.identified == 'tables') {
		layui.use(['table', 'laytpl', 'form'], function() {
			var table = layui.table,
				laytpl = layui.laytpl,
				form = layui.form,
				tableUrl = $('#test').data('url');
			table.render({
				elem: '#test',
				url: tableUrl,
				toolbar: '#toolbarDemo',
				title: '用户数据表',
				totalRow: true,
				cols: [
					[{
						type: 'checkbox',
						fixed: 'left'
					}, {
						field: 'id',
						title: 'ID',
						width: 80,
						fixed: 'left',
						unresize: true,
						sort: true,
						totalRowText: '合计'
					}, {
						field: 'username',
						title: '用户名',
						width: 120,
						edit: 'text'
					}, {
						field: 'email',
						title: '邮箱',
						width: 150,
						edit: 'text',
						templet: function(res) {
							return '<em>' + res.email + '</em>'
						}
					}, {
						field: 'experience',
						title: '积分',
						width: 80,
						sort: true,
						totalRow: true
					}, {
						field: 'sex',
						title: '性别',
						width: 80,
						edit: 'text',
						sort: true
					}, {
						field: 'sign',
						title: '签名'
					}, {
						field: 'city',
						title: '城市',
						width: 100
					}, {
						field: 'ip',
						title: 'IP',
						width: 120
					}, {
						field: 'joinTime',
						title: '加入时间',
						width: 120
					}, {
						fixed: 'right',
						title: '操作',
						toolbar: '#barDemo',
						width: 150
					}]
				],
				page: true
			});

			//工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
					case 'getCheckData':
						var data = checkStatus.data;
						layer.alert(JSON.stringify(data));
						break;
					case 'getCheckLength':
						var data = checkStatus.data;
						layer.msg('选中了：' + data.length + ' 个');
						break;
					case 'isAll':
						layer.msg(checkStatus.isAll ? '全选' : '未全选')
						break;
				};
			});


			table.on('edit(test3)', function(obj) {
				var value = obj.value //得到修改后的值
					,
					data = obj.data //得到所在行所有键值
					,
					field = obj.field; //得到字段
				layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
			});

			var pageUrl = $('#test5').data('url');
			table.render({
				elem: '#test5',
				url: pageUrl,
				cellMinWidth: 80,
				cols: [
					[{
						type: 'numbers'
					}, {
						type: 'checkbox'
					}, {
						field: 'id',
						title: 'ID',
						width: 100,
						unresize: true,
						sort: true
					}, {
						field: 'username',
						title: '用户名',
						width: 130,
						templet: '#usernameTpl'
					}, {
						field: 'city',
						title: '城市',
						width: 100,
						align: 'center'
					}, {
						field: 'wealth',
						title: '财富值',
						width: 150,
						sort: true
					}, {
						field: 'sign',
						title: '个性签名',
						minWidth: 200,
						sort: true
					}, {
						field: 'sex',
						title: '性别',
						align: 'center',
						width: 100,
						templet: '#switchTpl',
						unresize: true
					}, {
						field: 'lock',
						title: '是否锁定',
						width: 110,
						templet: '#checkboxTpl',
						unresize: true
					}]
				],
				page: true
			});

			//监听性别操作
			form.on('switch(sexDemo)', function(obj) {
				layer.tips(this.value + ' ' + this.name + '：' + obj.elem.checked, obj.othis);
			});

			//监听锁定操作
			form.on('checkbox(lockDemo)', function(obj) {
				layer.tips(this.value + ' ' + this.name + '：' + obj.elem.checked, obj.othis);
			});

			//单选框
			var pageUrl2 = $('#test6').data('url');
			table.render({
				elem: '#test6',
				url: pageUrl2,
				toolbar: '#toolbarDemo',
				cols: [
					[{
						type: 'radio'
					}, {
						field: 'id',
						width: 80,
						title: 'ID',
						sort: true
					}, {
						field: 'username',
						width: 80,
						title: '用户名'
					}, {
						field: 'sex',
						width: 80,
						title: '性别',
						align:'center',
						sort: true
					}, {
						field: 'city',
						width: 80,
						title: '城市'
					}, {
						field: 'sign',
						title: '签名',
						minWidth: 100
					}, {
						field: 'experience',
						width: 80,
						title: '积分',
						sort: true
					}, {
						field: 'score',
						width: 80,
						title: '评分',
						sort: true
					}, {
						field: 'classify',
						width: 80,
						title: '职业'
					}, {
						field: 'wealth',
						width: 135,
						title: '财富',
						sort: true
					}]
				],
				page: true
			});

			//头工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id); //获取选中行状态
				switch (obj.event) {
					case 'getCheckData':
						var data = checkStatus.data; //获取选中行数据
						layer.alert(JSON.stringify(data));
						break;
				};
			});
		});
	}



	exports('layuidemo', {});
});