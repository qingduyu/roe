;
(function(window) {

	'use strict';

	function classReg(className) {
		return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
	}
	var hasClass, addClass, removeClass;

	if ('classList' in document.documentElement) {
		hasClass = function(elem, c) {
			return elem.classList.contains(c);
		};
		addClass = function(elem, c) {
			elem.classList.add(c);
		};
		removeClass = function(elem, c) {
			elem.classList.remove(c);
		};
	} else {
		hasClass = function(elem, c) {
			return classReg(c).test(elem.className);
		};
		addClass = function(elem, c) {
			if (!hasClass(elem, c)) {
				elem.className = elem.className + ' ' + c;
			}
		};
		removeClass = function(elem, c) {
			elem.className = elem.className.replace(classReg(c), ' ');
		};
	}


	function toggleClass(elem, c) {
		var fn = hasClass(elem, c) ? removeClass : addClass;
		fn(elem, c);
	}

	var classie = {
		// full names
		hasClass: hasClass,
		addClass: addClass,
		removeClass: removeClass,
		toggleClass: toggleClass,
		// short names
		has: hasClass,
		add: addClass,
		remove: removeClass,
		toggle: toggleClass
	};
	window.classie = classie;

	function extend(a, b) {
		for (var key in b) {
			if (b.hasOwnProperty(key)) {
				a[key] = b[key];
			}
		}
		return a;
	}

	function SVGLoader(el, options) {
		this.el = el;
		this.options = extend({}, this.options);
		extend(this.options, options);
		this._init();
	}

	SVGLoader.prototype.options = {
		speedIn: 500,
		easingIn: mina.linear
	}

	SVGLoader.prototype._init = function() {
		var s = Snap(this.el.querySelector('svg'));
		this.path = s.select('path');
		this.initialPath = this.path.attr('d');

		var openingStepsStr = this.el.getAttribute('data-opening');
		this.openingSteps = openingStepsStr ? openingStepsStr.split(';') : '';
		this.openingStepsTotal = openingStepsStr ? this.openingSteps.length : 0;
		if (this.openingStepsTotal === 0) return;

		// if data-closing is not defined then the path will animate to its original shape
		var closingStepsStr = this.el.getAttribute('data-closing') ? this.el.getAttribute('data-closing') : this.initialPath;
		this.closingSteps = closingStepsStr ? closingStepsStr.split(';') : '';
		this.closingStepsTotal = closingStepsStr ? this.closingSteps.length : 0;

		this.isAnimating = false;

		if (!this.options.speedOut) {
			this.options.speedOut = this.options.speedIn;
		}
		if (!this.options.easingOut) {
			this.options.easingOut = this.options.easingIn;
		}
	}

	SVGLoader.prototype.show = function() {
		if (this.isAnimating) return false;
		this.isAnimating = true;
		// animate svg
		var self = this,
			onEndAnimation = function() {
				classie.addClass(self.el, 'pageload-loading');
			};
		this._animateSVG('in', onEndAnimation);
		classie.add(this.el, 'show');
	}

	SVGLoader.prototype.hide = function() {
		var self = this;
		classie.removeClass(this.el, 'pageload-loading');
		this._animateSVG('out', function() {
			// reset path
			self.path.attr('d', self.initialPath);
			classie.removeClass(self.el, 'show');
			self.isAnimating = false;
		});
	}

	SVGLoader.prototype._animateSVG = function(dir, callback) {
		var self = this,
			pos = 0,
			steps = dir === 'out' ? this.closingSteps : this.openingSteps,
			stepsTotal = dir === 'out' ? this.closingStepsTotal : this.openingStepsTotal,
			speed = dir === 'out' ? self.options.speedOut : self.options.speedIn,
			easing = dir === 'out' ? self.options.easingOut : self.options.easingIn,
			nextStep = function(pos) {
				if (pos > stepsTotal - 1) {
					if (callback && typeof callback == 'function') {
						callback();
					}
					return;
				}
				self.path.animate({
					'path': steps[pos]
				}, speed, easing, function() {
					nextStep(pos);
				});
				pos++;
			};

		nextStep(pos);
	}

	// add to global namespace
	window.SVGLoader = SVGLoader;

})(window);