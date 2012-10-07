// Generated by CoffeeScript 1.3.3
(function() {
  var Track,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Track = (function(_super) {

    __extends(Track, _super);

    function Track(map, origin_dir, origin_pos, color, container, width, height) {
      this.map = map;
      this.origin_dir = origin_dir;
      this.origin_pos = origin_pos;
      this.color = color;
      Track.__super__.constructor.call(this, container, width, height);
      this.red = parseInt(this.color[0], 16);
      this.green = parseInt(this.color[1], 16);
      this.blue = parseInt(this.color[2], 16);
      this.setBody();
    }

    Track.prototype.setActions = function(actions) {
      this.actions = actions;
      return this.frame = 0;
    };

    Track.prototype.setBody = function() {
      var i, x, y, _i, _results;
      this.dir = this.origin_dir;
      x = this.origin_pos.x;
      y = this.origin_pos.y;
      this.body = [];
      _results = [];
      for (i = _i = 0; _i < 7; i = ++_i) {
        _results.push(this.body.push(new Grain(x + i * this.dir.x, y + i * this.dir.y, this.map.grid_size, 0, Type.SNAKE, this.context)));
      }
      return _results;
    };

    Track.prototype.head = function() {
      return this.body[0];
    };

    Track.prototype.turn = function(dir) {
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
      return this.dir = new_dir;
    };

    Track.prototype.move = function() {
      var head, new_head, next_pos, tail;
      head = this.body[0];
      next_pos = {
        x: head.x + this.dir.x,
        y: head.y + this.dir.y
      };
      if (next_pos.x === -1) {
        next_pos.x = this.map.width - 1;
      }
      if (next_pos.x === this.map.width) {
        next_pos.x = 0;
      }
      if (next_pos.y === -1) {
        next_pos.y = this.map.height - 1;
      }
      if (next_pos.y === this.map.height) {
        next_pos.y = 0;
      }
      tail = this.body.pop();
      new_head = new Grain(next_pos.x, next_pos.y, this.map.grid_size, Type.SNAKE, 0, this.context);
      this.body.unshift(new_head);
      return true;
    };

    Track.prototype.render = function() {
      var blue, green, i, red, _i, _ref, _results;
      _results = [];
      for (i = _i = 0, _ref = this.body.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        red = Math.floor(this.red - this.red * i / 1.5 / this.body.length).toString(16);
        if (red.length === 1) {
          red += red;
        }
        green = Math.floor(this.green - this.green * i / 1.5 / this.body.length).toString(16);
        if (green.length === 1) {
          green += green;
        }
        blue = Math.floor(this.blue - this.blue * i / 1.5 / this.body.length).toString(16);
        if (blue.length === 1) {
          blue += blue;
        }
        _results.push(this.body[i].render("" + red + green + blue));
      }
      return _results;
    };

    Track.prototype.update = function() {
      if (this.actions[this.frame] === 'REFRAIN') {
        this.frame = 0;
        this.setBody();
      }
      if (this.frame < this.actions.length) {
        this.turn(this.actions[this.frame]);
      }
      this.frame++;
      this.move();
      return this.render();
    };

    return Track;

  })(Layer);

  this.Track = Track;

}).call(this);
