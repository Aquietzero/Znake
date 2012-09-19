// Generated by CoffeeScript 1.3.3
(function() {
  var Snake,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Snake = (function(_super) {

    __extends(Snake, _super);

    function Snake(map, container, width, height) {
      var i;
      this.map = map;
      Snake.__super__.constructor.call(this, container, width, height);
      this.dir = {
        x: 0,
        y: -1
      };
      this.body = (function() {
        var _i, _results;
        _results = [];
        for (i = _i = 0; _i < 7; i = ++_i) {
          _results.push(new Grain(20, 20 + i, this.map.grid_size, Type.SNAKE, this.context));
        }
        return _results;
      }).call(this);
    }

    Snake.prototype.head = function() {
      return this.body[0];
    };

    Snake.prototype.isValidToTurn = function(new_dir) {
      return this.dir.x + new_dir.x === 0 || this.dir.y + new_dir.y === 0;
    };

    Snake.prototype.isValidToMove = function(pos) {
      var _ref;
      if (!((_ref = this.map.$(pos.x, pos.y)) != null ? _ref.isType(Type.GROUND, Type.FOOD) : void 0)) {
        return false;
      }
      return true;
    };

    Snake.prototype.ateFood = function(pos) {
      var _ref;
      if (!((_ref = this.map.$(pos.x, pos.y)) != null ? _ref.isType(Type.FOOD) : void 0)) {
        return false;
      } else {
        this.map.deleteFood(pos.x, pos.y);
        this.map.generateFood();
        return true;
      }
    };

    Snake.prototype.turn = function(dir) {
      var new_dir;
      switch (dir) {
        case 'UP':
          new_dir = {
            x: 0,
            y: -1
          };
          break;
        case 'LEFT':
          new_dir = {
            x: -1,
            y: 0
          };
          break;
        case 'RIGHT':
          new_dir = {
            x: 1,
            y: 0
          };
          break;
        case 'DOWN':
          new_dir = {
            x: 0,
            y: 1
          };
      }
      if (!this.isValidToTurn(new_dir)) {
        return this.dir = new_dir;
      }
    };

    Snake.prototype.move = function() {
      var head, new_head, next_pos, tail;
      this.vibrate();
      head = this.body[0];
      next_pos = {
        x: head.x + this.dir.x,
        y: head.y + this.dir.y
      };
      if (!this.isValidToMove(next_pos)) {
        return false;
      } else {
        if (!this.ateFood(next_pos)) {
          tail = this.body.pop();
          tail.reset();
          this.map.$(tail.x, tail.y).value = 0;
        }
        new_head = new Grain(next_pos.x, next_pos.y, this.map.grid_size, Type.SNAKE, this.context);
        this.body.unshift(new_head);
        return true;
      }
    };

    Snake.prototype.vibrate = function() {
      var el, i, _i, _len, _ref, _results;
      _ref = this.body;
      _results = [];
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        el = _ref[i];
        if (i < 6) {
          _results.push(this.map.$(el.x, el.y).value += 3);
        }
      }
      return _results;
    };

    Snake.prototype.render = function() {
      var i, red, _i, _ref, _results;
      _results = [];
      for (i = _i = 0, _ref = this.body.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        red = Math.floor(15 - 15 * i / this.body.length).toString(16);
        if (red.length === 1) {
          red += red;
        }
        _results.push(this.body[i].render("" + red + "0000"));
      }
      return _results;
    };

    Snake.prototype.update = function() {
      this.move();
      return this.render();
    };

    return Snake;

  })(Layer);

  this.Snake = Snake;

}).call(this);
