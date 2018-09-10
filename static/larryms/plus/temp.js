;(function(window) {
	var ctx,
		hue,
		logo,
		form,
		buffer,
		target = {},
		tendrils = [],
		settings = {};
	settings.debug = true;
	settings.friction = 0.5;
	settings.trails = 20;
	settings.size = 50;
	settings.dampening = 0.25;
	settings.tension = 0.98;
	Math.TWO_PI = Math.PI * 2;
	// ========================================================================================
	// Oscillator
	// ----------------------------------------------------------------------------------------
	function Oscillator(options) {
		this.init(options || {});
	}
	Oscillator.prototype = (function() {
		var value = 0;
		return {
			init: function(options) {
				this.phase = options.phase || 0;
				this.offset = options.offset || 0;
				this.frequency = options.frequency || 0.001;
				this.amplitude = options.amplitude || 1;
			},
			update: function() {
				this.phase += this.frequency;
				value = this.offset + Math.sin(this.phase) * this.amplitude;
				return value;
			},
			value: function() {
				return value;
			}
		};
	})();
	// ========================================================================================
	// Tendril
	// ----------------------------------------------------------------------------------------
	function Tendril(options) {
		this.init(options || {});
	}
	Tendril.prototype = (function() {
		function Node() {
			this.x = 0;
			this.y = 0;
			this.vy = 0;
			this.vx = 0;
		}
		return {
			init: function(options) {
				this.spring = options.spring + (Math.random() * 0.1) - 0.05;
				this.friction = settings.friction + (Math.random() * 0.01) - 0.005;
				this.nodes = [];
				for (var i = 0, node; i < settings.size; i++) {
					node = new Node();
					node.x = target.x;
					node.y = target.y;
					this.nodes.push(node);
				}
			},
			update: function() {
				var spring = this.spring,
					node = this.nodes[0];
				node.vx += (target.x - node.x) * spring;
				node.vy += (target.y - node.y) * spring;
				for (var prev, i = 0, n = this.nodes.length; i < n; i++) {
					node = this.nodes[i];
					if (i > 0) {
						prev = this.nodes[i - 1];
						node.vx += (prev.x - node.x) * spring;
						node.vy += (prev.y - node.y) * spring;
						node.vx += prev.vx * settings.dampening;
						node.vy += prev.vy * settings.dampening;
					}
					node.vx *= this.friction;
					node.vy *= this.friction;
					node.x += node.vx;
					node.y += node.vy;
					spring *= settings.tension;
				}
			},
			draw: function() {
				var x = this.nodes[0].x,
					y = this.nodes[0].y,
					a, b;
				ctx.beginPath();
				ctx.moveTo(x, y);
				for (var i = 1, n = this.nodes.length - 2; i < n; i++) {
					a = this.nodes[i];
					b = this.nodes[i + 1];
					x = (a.x + b.x) * 0.5;
					y = (a.y + b.y) * 0.5;
					ctx.quadraticCurveTo(a.x, a.y, x, y);
				}
				a = this.nodes[i];
				b = this.nodes[i + 1];
				ctx.quadraticCurveTo(a.x, a.y, b.x, b.y);
				ctx.stroke();
				ctx.closePath();
			}
		};
	})();
	// ----------------------------------------------------------------------------------------
	function init(event) {
		document.removeEventListener('mousemove', init);
		document.removeEventListener('touchstart', init);
		document.addEventListener('mousemove', mousemove);
		document.addEventListener('touchmove', mousemove);
		document.addEventListener('touchstart', touchstart);
		mousemove(event);
		reset();
		loop();
	}

	function reset() {
		tendrils = [];
		for (var i = 0; i < settings.trails; i++) {
			tendrils.push(new Tendril({
				spring: 0.45 + 0.025 * (i / settings.trails)
			}));
		}
	}

	function loop() {
		if (!ctx.running) return;
		ctx.globalCompositeOperation = 'source-over';
		ctx.fillStyle = 'rgba(8,5,16,0.4)';
		ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
		ctx.globalCompositeOperation = 'lighter';
		ctx.strokeStyle = 'hsla(' + Math.round(hue.update()) + ',90%,50%,0.25)';
		ctx.lineWidth = 1;
		if (ctx.frame % 60 == 0) {
			console.log(hue.update(), Math.round(hue.update()), hue.phase, hue.offset, hue.frequency, hue.amplitude);
		}
		for (var i = 0, tendril; i < settings.trails; i++) {
			tendril = tendrils[i];
			tendril.update();
			tendril.draw();
		}
		ctx.frame++;
		ctx.stats.update();
		requestAnimFrame(loop);
	}

	function resize() {
		ctx.canvas.width = window.innerWidth;
		ctx.canvas.height = window.innerHeight;
	}

	function start() {
		if (!ctx.running) {
			ctx.running = true;
			loop();
		}
	}

	function stop() {
		ctx.running = false;
	}

	function mousemove(event) {
		if (event.touches) {
			target.x = event.touches[0].pageX;
			target.y = event.touches[0].pageY;
		} else {
			target.x = event.clientX
			target.y = event.clientY;
		}
		event.preventDefault();
	}

	function touchstart(event) {
		if (event.touches.length == 1) {
			target.x = event.touches[0].pageX;
			target.y = event.touches[0].pageY;
		}
	}

	function keyup(event) {
		switch (event.keyCode) {
			case 32:
				save();
				break;
			default:
				// console.log(event.keyCode);
		}
	}

	function letters(id) {
		var el = document.getElementById(id),
			letters = el.innerHTML.replace('&', '&').split(''),
			heading = '';
		for (var i = 0, n = letters.length, letter; i < n; i++) {
			letter = letters[i].replace('&', '&');
			heading += letter.trim() ? '<span class="letter-' + i + '">' + letter + '' : '?';
		}
		el.innerHTML = heading;
		setTimeout(function() {
			el.className = 'transition-in';
		}, (Math.random() * 500) + 500);
	}

	function save() {
		if (!buffer) {
			buffer = document.createElement('canvas');
			buffer.width = screen.availWidth;
			buffer.height = screen.availHeight;
			buffer.ctx = buffer.getContext('2d');
			form = document.createElement('form');
			form.method = 'post';
			form.input = document.createElement('input');
			form.input.type = 'hidden';
			form.input.name = 'data';
			form.appendChild(form.input);
			document.body.appendChild(form);
		}
		buffer.ctx.fillStyle = 'rgba(8,5,16)';
		buffer.ctx.fillRect(0, 0, buffer.width, buffer.height);
		buffer.ctx.drawImage(canvas,
			Math.round(buffer.width / 2 - canvas.width / 2),
			Math.round(buffer.height / 2 - canvas.height / 2)
		);
		buffer.ctx.drawImage(logo,
			Math.round(buffer.width / 2 - logo.width / 4),
			Math.round(buffer.height / 2 - logo.height / 4),
			logo.width / 2,
			logo.height / 2
		);
		window.open(buffer.toDataURL(), 'wallpaper', 'top=0,left=0,width=' + buffer.width + ',height=' + buffer.height);
		// form.input.value = buffer.toDataURL().substr(22);
		// form.submit();
	}
	window.requestAnimFrame = (function() {
		return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function(fn) {
			window.setTimeout(fn, 1000 / 60)
		};
	})();
	window.onload = function() {
		ctx = document.getElementById('canvas').getContext('2d');
		ctx.stats = new Stats();
		ctx.running = true;
		ctx.frame = 1;
		logo = new Image();
		logo.src = '';
		hue = new Oscillator({
			phase: Math.random() * Math.TWO_PI,
			amplitude: 85,
			frequency: 0.0015,
			offset: 285
		});
		letters('h1');
		letters('h2');
		document.addEventListener('mousemove', init);
		document.addEventListener('touchstart', init);
		document.body.addEventListener('orientationchange', resize);
		window.addEventListener('resize', resize);
		window.addEventListener('keyup', keyup);
		window.addEventListener('focus', start);
		window.addEventListener('blur', stop);
		resize();
		if (window.DEBUG) {
			var gui = new dat.GUI();
			// gui.add(settings, 'debug');
			settings.gui.add(settings, 'trails', 1, 30).onChange(reset);
			settings.gui.add(settings, 'size', 25, 75).onFinishChange(reset);
			settings.gui.add(settings, 'friction', 0.45, 0.55).onFinishChange(reset);
			settings.gui.add(settings, 'dampening', 0.01, 0.4).onFinishChange(reset);
			settings.gui.add(settings, 'tension', 0.95, 0.999).onFinishChange(reset);
			document.body.appendChild(ctx.stats.domElement);
		}
	};
})(window);
var Stats = function() {
	var e = Date.now(),
		t = e,
		i = 0,
		n = 1 / 0,
		r = 0,
		s = 0,
		o = 1 / 0,
		a = 0,
		l = 0,
		h = 0,
		c = document.createElement("div");
	c.id = "stats", c.addEventListener("mousedown", function(e) {
		e.preventDefault(), v(++h % 2)
	}, !1), c.style.cssText = "width:80px;opacity:0.9;cursor:pointer";
	var u = document.createElement("div");
	u.id = "fps", u.style.cssText = "padding:0 0 3px 3px;text-align:left;background-color:#002", c.appendChild(u);
	var d = document.createElement("div");
	d.id = "fpsText", d.style.cssText = "color:#0ff;font-family:Helvetica,Arial,sans-serif;font-size:9px;font-weight:bold;line-height:15px", d.innerHTML = "FPS", u.appendChild(d);
	var p = document.createElement("div");
	for (p.id = "fpsGraph", p.style.cssText = "position:relative;width:74px;height:30px;background-color:#0ff", u.appendChild(p); 74 > p.children.length;) {
		var f = document.createElement("span");
		f.style.cssText = "width:1px;height:30px;float:left;background-color:#113", p.appendChild(f)
	}
	var m = document.createElement("div");
	m.id = "ms", m.style.cssText = "padding:0 0 3px 3px;text-align:left;background-color:#020;display:none", c.appendChild(m);
	var g = document.createElement("div");
	g.id = "msText", g.style.cssText = "color:#0f0;font-family:Helvetica,Arial,sans-serif;font-size:9px;font-weight:bold;line-height:15px", g.innerHTML = "MS", m.appendChild(g);
	var y = document.createElement("div");
	for (y.id = "msGraph", y.style.cssText = "position:relative;width:74px;height:30px;background-color:#0f0", m.appendChild(y); 74 > y.children.length;) {
		var f = document.createElement("span");
		f.style.cssText = "width:1px;height:30px;float:left;background-color:#131", y.appendChild(f)
	}
	var v = function(e) {
			switch (h = e) {
				case 0:
					u.style.display = "block", m.style.display = "none";
					break;
				case 1:
					u.style.display = "none", m.style.display = "block"
			}
		},
		b = function(e, t) {
			var i = e.appendChild(e.firstChild);
			i.style.height = t + "px"
		};
	return {
		REVISION: 11,
		domElement: c,
		setMode: v,
		begin: function() {
			e = Date.now()
		},
		end: function() {
			var h = Date.now();
			return i = h - e, n = Math.min(n, i), r = Math.max(r, i), g.textContent = i + " MS (" + n + "-" + r + ")", b(y, Math.min(30, 30 - 30 * (i / 200))), l++, h > t + 1e3 && (s = Math.round(1e3 * l / (h - t)), o = Math.min(o, s), a = Math.max(a, s), d.textContent = s + " FPS (" + o + "-" + a + ")", b(p, Math.min(30, 30 - 30 * (s / 100))), t = h, l = 0), h
		},
		update: function() {
			e = this.end()
		}
	}
};