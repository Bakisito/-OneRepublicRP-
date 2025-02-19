(function () {

	var canvas, ctx;
	var points = [];
	var maxDist = 100;

	function init() {
		//Add on load scripts
		canvas = document.getElementById("snow");
		ctx = canvas.getContext("2d");
		resizeCanvas();
		pointFun();
		setInterval(pointFun, 20);
		window.addEventListener('resize', resizeCanvas, false);
	}
	//Particle constructor
	function point() {
		this.x = Math.random() * (canvas.width + maxDist) - (maxDist / 2);
		this.y = Math.random() * (canvas.height + maxDist) - (maxDist / 2);
		this.z = (Math.random() * 0.5) + 0.5;
		this.vx = ((Math.random() * 2) - 0.5) * this.z;
		this.vy = ((Math.random() * 1.5) + 1.5) * this.z;
		this.fill = "rgba(255,255,255," + ((0.4 * Math.random()) + 0.5) + ")";
		this.dia = ((Math.random() * 2.5) + 1.5) * this.z;
		points.push(this);
	}
	//Point generator
	function generatePoints(amount) {
		var temp;
		for (var i = 0; i < amount; i++) {
			temp = new point();
		};
		// console.log(points);
	}
	//Point drawer
	function draw(obj) {
		ctx.beginPath();
		ctx.strokeStyle = "transparent";
		ctx.fillStyle = obj.fill;
		ctx.arc(obj.x, obj.y, obj.dia, 0, 2 * Math.PI);
		ctx.closePath();
		ctx.stroke();
		ctx.fill();
	}
	//Updates point position values
	function update(obj) {
		obj.x += obj.vx;
		obj.y += obj.vy;
		if (obj.x > canvas.width + (maxDist / 2)) {
			obj.x = -(maxDist / 2);
		}
		else if (obj.xpos < -(maxDist / 2)) {
			obj.x = canvas.width + (maxDist / 2);
		}
		if (obj.y > canvas.height + (maxDist / 2)) {
			obj.y = -(maxDist / 2);
		}
		else if (obj.y < -(maxDist / 2)) {
			obj.y = canvas.height + (maxDist / 2);
		}
	}
	//
	function pointFun() {
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		for (var i = 0; i < points.length; i++) {
			draw(points[i]);
			update(points[i]);
		};
	}

	function resizeCanvas() {
		canvas.width = window.innerWidth;
		canvas.height = window.innerHeight;
		points = [];
		generatePoints(window.innerWidth / 3);
		pointFun();
	}

	//Execute when DOM has loaded
	document.addEventListener('DOMContentLoaded', init, false);
})();

