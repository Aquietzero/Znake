// Generated by CoffeeScript 1.3.3
(function() {
  var Map,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Map = (function(_super) {

    __extends(Map, _super);

    function Map(grid_size, container, width, height) {
      var x, y, _i, _j, _ref, _ref1;
      this.grid_size = grid_size;
      Map.__super__.constructor.call(this, container, width, height);
      this.width = this.canvas.width / this.grid_size;
      this.height = this.canvas.height / this.grid_size;
      this.grains = {};
      for (x = _i = 0, _ref = this.width; 0 <= _ref ? _i < _ref : _i > _ref; x = 0 <= _ref ? ++_i : --_i) {
        for (y = _j = 0, _ref1 = this.height; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; y = 0 <= _ref1 ? ++_j : --_j) {
          this.grains["" + x + "-" + y] = new Grain(x, y, this.grid_size, Type.GROUND, this.context);
        }
      }
      this.renderGrid();
    }

    Map.prototype.$ = function(x, y) {
      return this.grains["" + x + "-" + y];
    };

    Map.prototype.isContain = function(x, y) {
      return (0 <= x && x < this.width) && (0 <= y && y < this.height);
    };

    Map.prototype.generateFood = function() {
      var food, grain, ground, index;
      ground = (function() {
        var _ref, _results;
        _ref = this.grains;
        _results = [];
        for (index in _ref) {
          grain = _ref[index];
          if (grain.isType(Type.GROUND)) {
            _results.push(grain);
          }
        }
        return _results;
      }).call(this);
      food = ground[Utils.random(0, ground.length)];
      food.setType(Type.FOOD);
      return food.render();
    };

    Map.prototype.deleteFood = function(x, y) {
      var food;
      food = this.grains["" + x + "-" + y];
      return food.setType(Type.GROUND);
    };

    Map.prototype.wave = function() {
      var down, left, mid, next, offset, right, up, x, xh, xl, y, yh, yl, _i, _j, _k, _ref, _ref1, _ref2, _results;
      next = {};
      for (y = _i = 0, _ref = this.height; 0 <= _ref ? _i < _ref : _i > _ref; y = 0 <= _ref ? ++_i : --_i) {
        for (x = _j = 0, _ref1 = this.width; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; x = 0 <= _ref1 ? ++_j : --_j) {
          xl = x === 0 ? this.width - 1 : x - 1;
          xh = x === this.width - 1 ? 0 : x + 1;
          yl = y === 0 ? this.height - 1 : y - 1;
          yh = y === this.height - 1 ? 0 : y + 1;
          up = this.grains["" + x + "-" + yl].value;
          down = this.grains["" + x + "-" + yh].value;
          left = this.grains["" + xl + "-" + y].value;
          right = this.grains["" + xh + "-" + y].value;
          mid = this.grains["" + x + "-" + y].value;
          offset = (up + down + left + right) / 4 - mid;
          next["" + x + "-" + y] = mid + offset * 0.8;
        }
      }
      _results = [];
      for (y = _k = 1, _ref2 = this.height - 1; 1 <= _ref2 ? _k < _ref2 : _k > _ref2; y = 1 <= _ref2 ? ++_k : --_k) {
        _results.push((function() {
          var _l, _ref3, _results1;
          _results1 = [];
          for (x = _l = 1, _ref3 = this.width - 1; 1 <= _ref3 ? _l < _ref3 : _l > _ref3; x = 1 <= _ref3 ? ++_l : --_l) {
            _results1.push(this.grains["" + x + "-" + y].value = next["" + x + "-" + y]);
          }
          return _results1;
        }).call(this));
      }
      return _results;
    };

    Map.prototype.update = function() {
      this.wave();
      return this.updateGrains();
    };

    Map.prototype.renderGrid = function() {
      var i, _i, _j, _ref, _ref1, _ref2, _ref3;
      this.context.strokeStyle = '#000000';
      this.context.beginPath();
      for (i = _i = 0.5, _ref = this.canvas.width, _ref1 = this.grid_size; 0.5 <= _ref ? _i <= _ref : _i >= _ref; i = _i += _ref1) {
        this.context.moveTo(i, 0);
        this.context.lineTo(i, this.canvas.height);
      }
      for (i = _j = 0.5, _ref2 = this.canvas.height, _ref3 = this.grid_size; 0.5 <= _ref2 ? _j <= _ref2 : _j >= _ref2; i = _j += _ref3) {
        this.context.moveTo(0, i);
        this.context.lineTo(this.canvas.width, i);
      }
      this.context.closePath();
      return this.context.stroke();
    };

    Map.prototype.updateGrains = function() {
      var grain, index, _ref, _results;
      _ref = this.grains;
      _results = [];
      for (index in _ref) {
        grain = _ref[index];
        _results.push(grain.render());
      }
      return _results;
    };

    return Map;

  })(Layer);

  this.Map = Map;

}).call(this);
