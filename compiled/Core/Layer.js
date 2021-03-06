// Generated by CoffeeScript 1.3.3
(function() {
  var Layer;

  Layer = (function() {

    function Layer(container, width, height) {
      this.container = container;
      this.width = width;
      this.height = height;
      this.canvas = document.createElement('canvas');
      this.canvas.width = width;
      this.canvas.height = height;
      document.getElementById(this.container).appendChild(this.canvas);
      this.initCanvas();
    }

    Layer.prototype.initCanvas = function() {
      this.context = this.canvas.getContext('2d');
      this.context.fillStyle = "rgba(0, 0, 0, 0)";
      return this.context.fillRect(0, 0, this.width, this.height);
    };

    Layer.prototype.update = function() {};

    return Layer;

  })();

  this.Layer = Layer;

}).call(this);
