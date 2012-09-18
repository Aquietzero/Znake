// Generated by CoffeeScript 1.3.3
(function() {
  var Particle;

  Particle = (function() {

    function Particle(pos, size, life, context) {
      this.pos = pos;
      this.size = size;
      this.life = life;
      this.context = context;
      this.x = 0;
      this.y = 0;
      this.age = 0;
      this.velocity = new Vector(Utils.randomOne(), Utils.randomOne());
    }

    Particle.prototype.evolve = function() {
      this.age++;
      return this.render();
    };

    Particle.prototype.isDead = function() {
      return this.age > this.life;
    };

    Particle.prototype.clear = function() {
      var dist, loc, x, y;
      dist = this.velocity.mul(this.age);
      loc = this.pos.add(dist);
      loc.floor();
      x = loc.x * this.size;
      y = loc.y * this.size;
      this.context.fillStyle = "rgba(0, 0, 0, 0)";
      return this.context.fillRect(x + 1, y + 1, this.size - 1, this.size - 1);
    };

    Particle.prototype.render = function() {
      var dist, loc, opacity;
      this.context.fillStyle = "rgba(0, 0, 0, 0.1)";
      this.context.fillRect(this.x + 1, this.y + 1, this.size - 1, this.size - 1);
      dist = this.velocity.mul(this.age);
      loc = this.pos.add(dist);
      loc.floor();
      this.x = loc.x * this.size;
      this.y = loc.y * this.size;
      opacity = 1 - this.age / this.life;
      this.context.fillStyle = "rgba(100, 100, 0, " + opacity + ")";
      return this.context.fillRect(this.x + 1, this.y + 1, this.size - 1, this.size - 1);
    };

    return Particle;

  })();

  this.Particle = Particle;

}).call(this);