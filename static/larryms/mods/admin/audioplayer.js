layui.define(['howler', 'SiriWave'], function(exports) {
	var howler = layui.howler,
		SiriWave = layui.SiriWave;
	var elms = ['track', 'timer', 'duration', 'playBtn', 'pauseBtn', 'prevBtn', 'nextBtn', 'playlistBtn', 'volumeBtn', 'progress', 'bar', 'wave', 'loading', 'playlist', 'list', 'volume', 'barEmpty', 'barFull', 'sliderBtn', 'station0', 'title0', 'live0', 'playing0', 'station1', 'title1', 'live1', 'playing1', 'station2', 'title2', 'live2', 'playing2', 'station3', 'title3', 'live3', 'playing3', 'station4', 'title4', 'live4', 'playing4', 'waveform2', 'sprite0', 'sprite1', 'sprite2', 'sprite3', 'sprite4', 'sprite5'];
	elms.forEach(function(elm) {
		window[elm] = document.getElementById(elm);
	});
	//定义音乐播放器
	var Player = function(playlist, url) {
		this.playlist = playlist;
		this.index = 0;
		track.innerHTML = '1. ' + playlist[0].title;
		playlist.forEach(function(song) {
			var div = document.createElement('div');
			div.className = 'list-song';
			div.innerHTML = song.title;
			div.onclick = function() {
				player.skipTo(playlist.indexOf(song));
			};
			list.appendChild(div);
		});
	};
	Player.prototype = {
		play: function(index) {
			var self = this;
			var sound;
			index = typeof index === 'number' ? index : self.index;
			var data = self.playlist[index];
			if (data.howl) {
				sound = data.howl;
			} else {
				sound = data.howl = new Howl({
					src: ['./audio/' + data.file + '.mp3', './audio/' + data.file + '.mp3'],
					html5: true,
					onplay: function() {
						duration.innerHTML = self.formatTime(Math.round(sound.duration()));
						requestAnimationFrame(self.step.bind(self));
						wave.container.style.display = 'block';
						bar.style.display = 'none';
						pauseBtn.style.display = 'block';
					},
					onload: function() {
						wave.container.style.display = 'block';
						bar.style.display = 'none';
						loading.style.display = 'none';
					},
					onend: function() {
						wave.container.style.display = 'none';
						bar.style.display = 'block';
						self.skip('next');
					},
					onpause: function() {
						wave.container.style.display = 'none';
						bar.style.display = 'block';
					},
					onstop: function() {
						wave.container.style.display = 'none';
						bar.style.display = 'block';
					}
				});
			}
			sound.play();
			track.innerHTML = (index + 1) + '. ' + data.title;
			if (sound.state() === 'loaded') {
				playBtn.style.display = 'none';
				pauseBtn.style.display = 'block';
			} else {
				loading.style.display = 'block';
				playBtn.style.display = 'none';
				pauseBtn.style.display = 'none';
			}
			self.index = index;
		},
		pause: function() {
			var self = this;
			var sound = self.playlist[self.index].howl;
			sound.pause();
			playBtn.style.display = 'block';
			pauseBtn.style.display = 'none';
		},
		skip: function(direction) {
			var self = this;
			var index = 0;
			if (direction === 'prev') {
				index = self.index - 1;
				if (index < 0) {
					index = self.playlist.length - 1;
				}
			} else {
				index = self.index + 1;
				if (index >= self.playlist.length) {
					index = 0;
				}
			}
			self.skipTo(index);
		},
		skipTo: function(index) {
			var self = this;
			if (self.playlist[self.index].howl) {
				self.playlist[self.index].howl.stop();
			}
			progress.style.width = '0%';
			self.play(index);
		},
		volume: function(val) {
			var self = this;
			Howler.volume(val);
			var barWidth = (val * 90) / 100;
			barFull.style.width = (barWidth * 100) + '%';
			sliderBtn.style.left = (window.innerWidth * barWidth + window.innerWidth * 0.05 - 25) + 'px';
		},
		seek: function(per) {
			var self = this;
			var sound = self.playlist[self.index].howl;
			if (sound.playing()) {
				sound.seek(sound.duration() * per);
			}
		},
		step: function() {
			var self = this;
			var sound = self.playlist[self.index].howl;
			var seek = sound.seek() || 0;
			timer.innerHTML = self.formatTime(Math.round(seek));
			progress.style.width = (((seek / sound.duration()) * 100) || 0) + '%';
			if (sound.playing()) {
				requestAnimationFrame(self.step.bind(self));
			}
		},
		togglePlaylist: function() {
			var self = this;
			var display = (playlist.style.display === 'block') ? 'none' : 'block';
			setTimeout(function() {
				playlist.style.display = display;
			}, (display === 'block') ? 0 : 500);
			playlist.className = (display === 'block') ? 'fadein' : 'fadeout';
		},
		toggleVolume: function() {
			var self = this;
			var display = (volume.style.display === 'block') ? 'none' : 'block';
			setTimeout(function() {
				volume.style.display = display;
			}, (display === 'block') ? 0 : 500);
			volume.className = (display === 'block') ? 'fadein' : 'fadeout';
		},
		formatTime: function(secs) {
			var minutes = Math.floor(secs / 60) || 0;
			var seconds = (secs - minutes * 60) || 0;
			return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
		}
	};

	var player = new Player([{
		title: '风的季节 -亮声系列',
		file: 'fdjj',
		howl: null
	}, {
		title: '凤凰于飞 -费玉清',
		file: 'fhyf',
		howl: null
	}, {
		title: 'That Girl(粤语版) -亮声Open',
		file: 'thatgirl',
		howl: null
	}, {
		title: '欢喜就好 -陈陈雷',
		file: 'hxjh',
		howl: null
	}]);
	player.play();
	playBtn.addEventListener('click', function() {
		player.play();
	});
	pauseBtn.addEventListener('click', function() {
		player.pause();
	});
	prevBtn.addEventListener('click', function() {
		player.skip('prev');
	});
	nextBtn.addEventListener('click', function() {
		player.skip('next');
	});
	waveform.addEventListener('click', function(event) {
		player.seek(event.clientX / window.innerWidth);
	});
	playlistBtn.addEventListener('click', function() {
		player.togglePlaylist();
	});
	playlist.addEventListener('click', function() {
		player.togglePlaylist();
	});
	volumeBtn.addEventListener('click', function() {
		player.toggleVolume();
	});
	volume.addEventListener('click', function() {
		player.toggleVolume();
	});
	barEmpty.addEventListener('click', function(event) {
		var per = event.layerX / parseFloat(barEmpty.scrollWidth);
		player.volume(per);
	});
	sliderBtn.addEventListener('mousedown', function() {
		window.sliderDown = true;
	});
	sliderBtn.addEventListener('touchstart', function() {
		window.sliderDown = true;
	});
	volume.addEventListener('mouseup', function() {
		window.sliderDown = false;
	});
	volume.addEventListener('touchend', function() {
		window.sliderDown = false;
	});
	var move = function(event) {
		if (window.sliderDown) {
			var x = event.clientX || event.touches[0].clientX;
			var startX = window.innerWidth * 0.05;
			var layerX = x - startX;
			var per = Math.min(1, Math.max(0, layerX / parseFloat(barEmpty.scrollWidth)));
			player.volume(per);
		}
	};
	volume.addEventListener('mousemove', move);
	volume.addEventListener('touchmove', move);
	var wave = new SiriWave({
		container: waveform,
		width: window.innerWidth,
		height: window.innerHeight * 0.5,
		cover: true,
		speed: 0.03,
		amplitude: 0.7,
		frequency: 2
	});
	wave.start();
	var resize = function() {
		var height = window.innerHeight * 0.3;
		var width = window.innerWidth;
		wave.height = height;
		wave.height_2 = height / 2;
		wave.MAX = wave.height_2 - 4;
		wave.width = width;
		wave.width_2 = width / 2;
		wave.width_4 = width / 4;
		wave.canvas.height = height;
		wave.canvas.width = width;
		wave.container.style.margin = -(height / 4) + 'px auto';
		var sound = player.playlist[player.index].howl;
		if (sound) {
			var vol = sound.volume();
			var barWidth = (vol * 0.9);
			sliderBtn.style.left = (window.innerWidth * barWidth + window.innerWidth * 0.05 - 25) + 'px';
		}
	};
	window.addEventListener('resize', resize);
	resize();
	//直播电台
	var Radio = function(stations) {
		var self = this;
		self.stations = stations;
		self.index = 0;
		for (var i = 0; i < self.stations.length; i++) {
			window['title' + i].innerHTML = '<b>' + self.stations[i].freq + '</b> ' + self.stations[i].title;
			window['station' + i].addEventListener('click', function(index) {
				var isNotPlaying = (self.stations[index].howl && !self.stations[index].howl.playing());
				radio.stop();
				if (isNotPlaying || !self.stations[index].howl) {
					radio.play(index);
				}
			}.bind(self, i));
		}
	};
	Radio.prototype = {
		play: function(index) {
			var self = this;
			var sound;
			index = typeof index === 'number' ? index : self.index;
			var data = self.stations[index];
			if (data.howl) {
				sound = data.howl;
			} else {
				sound = data.howl = new Howl({
					src: data.src,
					html5: true,
					format: ['mp3', 'aac']
				});
			}
			sound.play();
			self.toggleStationDisplay(index, true);
			self.index = index;
		},
		stop: function() {
			var self = this;
			var sound = self.stations[self.index].howl;
			self.toggleStationDisplay(self.index, false);
			if (sound) {
				sound.stop();
			}
		},
		toggleStationDisplay: function(index, state) {
			var self = this;
			window['station' + index].style.backgroundColor = state ? 'rgba(255, 255, 255, 0.33)' : '';
			window['live' + index].style.opacity = state ? 1 : 0;
			window['playing' + index].style.display = state ? 'block' : 'none';
		}
	};
	var radio = new Radio([{
		freq: '81.4',
		title: "Groove Salad",
		src: ['http://ice1.somafm.com/groovesalad-128-mp3', 'http://ice1.somafm.com/groovesalad-128-aac'],
		howl: null
	}, {
		freq: '89.9',
		title: "Secret Agent",
		src: ['http://ice1.somafm.com/secretagent-128-mp3', 'http://ice1.somafm.com/secretagent-128-aac'],
		howl: null
	}, {
		freq: '98.9',
		title: "Indie Pop",
		src: ['http://ice1.somafm.com/indiepop-128-mp3', 'http://ice1.somafm.com/indiepop-128-aac'],
		howl: null
	}, {
		freq: '103.3',
		title: "Police Radio",
		src: ['http://ice1.somafm.com/sf1033-128-mp3', 'http://ice2.somafm.com/sf1033-64-aac'],
		howl: null
	}, {
		freq: '107.7',
		title: "The Trip",
		src: ['http://ice1.somafm.com/thetrip-128-mp3', 'http://ice2.somafm.com/thetrip-64-aac'],
		howl: null
	}]);


	var Sprite = function(options) {
		var self = this;
		self.sounds = [];
		self._width = options.width;
		self._left = options.left;
		self._spriteMap = options.spriteMap;
		self._sprite = options.sprite;
		self.setupListeners();
		self.sound = new Howl({
			src: options.src,
			sprite: options.sprite
		});
		window.addEventListener('resize', function() {
			self.resize();
		}, false);
		self.resize();
		requestAnimationFrame(self.step.bind(self));
	};
	Sprite.prototype = {
		setupListeners: function() {
			var self = this;
			var keys = Object.keys(self._spriteMap);
			keys.forEach(function(key) {
				window[key].addEventListener('click', function() {
					self.play(key);
				}, false);
			});
		},
		play: function(key) {
			var self = this;
			var sprite = self._spriteMap[key];
			var id = self.sound.play(sprite);
			var elm = document.createElement('div');
			elm.className = 'progress';
			elm.id = id;
			elm.dataset.sprite = sprite;
			window[key].appendChild(elm);
			self.sounds.push(elm);
			self.sound.once('end', function() {
				var index = self.sounds.indexOf(elm);
				if (index >= 0) {
					self.sounds.splice(index, 1);
					window[key].removeChild(elm);
				}
			}, id);
		},
		resize: function() {
			var self = this;
			var scale = window.innerWidth / 3600;
			var keys = Object.keys(self._spriteMap);
			for (var i = 0; i < keys.length; i++) {
				var sprite = window[keys[i]];
				sprite.style.width = Math.round(self._width[i] * scale) + 'px';
				if (self._left[i]) {
					sprite.style.left = Math.round(self._left[i] * scale) + 'px';
				}
			}
		},
		step: function() {
			var self = this;
			for (var i = 0; i < self.sounds.length; i++) {
				var id = parseInt(self.sounds[i].id, 10);
				var offset = self._sprite[self.sounds[i].dataset.sprite][0];
				var seek = (self.sound.seek(id) || 0) - (offset / 1000);
				self.sounds[i].style.width = (((seek / self.sound.duration(id)) * 100) || 0) + '%';
			}
			requestAnimationFrame(self.step.bind(self));
		}
	};

	var sprite = new Sprite({
		width: [15, 40, 50, 40, 70, 870],
		left: [0, 110, 270, 440, 585,785],
		src: ['./audio/sound2.webm', './audio/sound2.mp3'],
		sprite: {
			one: [0, 450],
			two: [2000, 250],
			three: [4000, 350],
			four: [6000, 380],
			five: [8000, 340],
			beat: [10000, 11163]
		},
		spriteMap: {
			sprite0: 'one',
			sprite1: 'two',
			sprite2: 'three',
			sprite3: 'four',
			sprite4: 'five',
			sprite5: 'beat'
		}
	});
	exports('audioplayer', {});
});