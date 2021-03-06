// Generated by CoffeeScript 1.3.3
(function() {
  var Vector;

  Vector = (function() {

    function Vector(x, y) {
      this.x = x;
      this.y = y;
    }

    Vector.prototype.add = function(v) {
      return new Vector(this.x + v.x, this.y + v.y);
    };

    Vector.prototype.sub = function(v) {
      return new Vector(this.x - v.x, this.y - v.y);
    };

    Vector.prototype.mul = function(s) {
      return new Vector(this.x * s, this.y * s);
    };

    Vector.prototype.floor = function() {
      this.x = Math.floor(this.x);
      return this.y = Math.floor(this.y);
    };

    return Vector;

  })();

  this.Vector = Vector;

}).call(this);
