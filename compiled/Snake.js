// Generated by CoffeeScript 1.3.3
(function() {
  var Snake;

  Snake = (function() {

    function Snake(map, context) {
      var grain, i, _i;
      this.map = map;
      this.context = context;
      this.dir = {
        x: 0,
        y: -1
      };
      this.body = [];
      for (i = _i = 0; _i < 7; i = ++_i) {
        grain = this.map.$(20, 20 + i);
        grain.setType(Type.SNAKE);
        this.body.push(grain);
      }
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
      var food, _ref;
      if (!((_ref = this.map.$(pos.x, pos.y)) != null ? _ref.isType(Type.FOOD) : void 0)) {
        return false;
      } else {
        food = this.map.$(pos.x, pos.y);
        food.reset();
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
        }
        new_head = this.map.$(next_pos.x, next_pos.y);
        new_head.setType(Type.SNAKE);
        this.body.unshift(new_head);
        this.render();
        return true;
      }
    };

    Snake.prototype.vibrate = function() {
      var i, _i, _results;
      _results = [];
      for (i = _i = 0; _i < 4; i = ++_i) {
        _results.push(this.body[i].value += 3);
      }
      return _results;
    };

    Snake.prototype.render = function() {
      var i, red, _i, _ref, _results;
      _results = [];
      for (i = _i = 0, _ref = this.body.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        red = Math.floor(9 - 9 * i / this.body.length);
        _results.push(this.body[i].render("" + red + red + "0000"));
      }
      return _results;
    };

    return Snake;

  })();

  this.Snake = Snake;

}).call(this);
