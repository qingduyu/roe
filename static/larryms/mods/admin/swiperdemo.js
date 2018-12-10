layui.define(['jquery', 'swiper', 'code'], function(exports) {
	var $ = layui.$,
		larryms = layui.larryms,
		code = layui.code,
		swiper = layui.swiper;
	//示例1  larrymsSwiper1
	var mySwiper1 = new swiper('#larrymsSwiper1', {
		effect: 'coverflow',
		slidesPerView: 3,
		centeredSlides: true,
		autoplay: true,
		loop: true,
		coverflowEffect: {
			rotate: 30,
			stretch: 10,
			depth: 70,
			modifier: 3,
			slideShadows: true
		},
	});
	//示例2 certify
	setTimeout(function() {
		var certifySwiper = new swiper('#certify .swiper-container', {
			watchSlidesProgress: true,
			slidesPerView: 'auto',
			centeredSlides: true,
			loop: true,
			loopedSlides: 5,
			autoplay: true,
			navigation: {
				nextEl: '.swiper-button-next',
				prevEl: '.swiper-button-prev',
			},
			pagination: {
				el: '.swiper-pagination',
			},
			on: {
				progress: function(progress) {
					for (i = 0; i < this.slides.length; i++) {
						var slide = this.slides.eq(i);
						var slideProgress = this.slides[i].progress;
						modify = 1;
						if (Math.abs(slideProgress) > 1) {
							modify = (Math.abs(slideProgress) - 1) * 0.3 + 1;
						}
						translate = slideProgress * modify * 260 + 'px';
						scale = 1 - Math.abs(slideProgress) / 5;
						zIndex = 999 - Math.abs(Math.round(10 * slideProgress));
						slide.transform('translateX(' + translate + ') scale(' + scale + ')');
						slide.css('zIndex', zIndex);
						slide.css('opacity', 1);
						if (Math.abs(slideProgress) > 3) {
							slide.css('opacity', 0);
						}
					}
				},
				setTransition: function(transition) {
					for (var i = 0; i < this.slides.length; i++) {
						var slide = this.slides.eq(i)
						slide.transition(transition);
					}
				}
			}

		});
	}, 200);

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
	exports('swiperdemo', {});
});