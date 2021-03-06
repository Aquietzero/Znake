// Generated by CoffeeScript 1.3.3
(function() {
  var ParticleLayer;

  ParticleLayer = (function() {

    function ParticleLayer(container, width, height) {
      this.width = width;
      this.height = height;
      this.canvas = document.createElement('canvas');
      this.canvas.id = 'ParticleCanvas';
      this.canvas.width = width;
      this.canvas.height = height;
      document.getElementById(container).appendChild(this.canvas);
      this.initCanvas();
      this.initParticleSystem();
    }

    ParticleLayer.prototype.initCanvas = function() {
      this.context = this.canvas.getContext('2d');
      this.context.fillStyle = 'rgba(0, 0, 0, 0)';
      return this.context.fillRect(0, 0, this.width, this.height);
    };

    ParticleLayer.prototype.initParticleSystem = function() {
      return this.particleSystem = new ParticleSystem(this.context);
    };

    ParticleLayer.prototype.run = function() {
      var update,
        _this = this;
      update = function() {
        return _this.particleSystem.evolve();
      };
      return this.run_id = setInterval(update, 100);
    };

    return ParticleLayer;

  })();

  this.ParticleLayer = ParticleLayer;

}).call(this);
