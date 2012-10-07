// Generated by CoffeeScript 1.3.3
(function() {
  var Game;

  Game = (function() {

    function Game(container, width, height) {
      this.container = container;
      this.width = width;
      this.height = height;
      this.layers = [];
      this.initMap();
      this.initNumberBoard();
      this.initSnake();
      this.status = 'RUNNING';
      this.initEvents();
    }

    Game.prototype.initMap = function() {
      this.map = new Map(10, this.container, this.width, this.height);
      this.map.generateFood();
      return this.layers.push(this.map);
    };

    Game.prototype.initSnake = function() {
      this.snake = new Snake(this.map, this.numberBoard, this.container, this.width, this.height);
      return this.layers.push(this.snake);
    };

    Game.prototype.initNumberBoard = function() {
      this.numberBoard = new NumberBoard(this.container, 200, 110);
      return this.layers.push(this.numberBoard);
    };

    Game.prototype.initEvents = function() {
      var _this = this;
      return document.onkeydown = function(event) {
        switch (event.keyCode) {
          case 38:
            return _this.snake.turn('UP');
          case 39:
            return _this.snake.turn('RIGHT');
          case 40:
            return _this.snake.turn('DOWN');
          case 37:
            return _this.snake.turn('LEFT');
          case 32:
            return _this.pause();
        }
      };
    };

    Game.prototype.run = function() {
      var update,
        _this = this;
      update = function() {
        var layer, _i, _len, _ref, _results;
        _ref = _this.layers;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          layer = _ref[_i];
          if (!layer.update()) {
            _results.push(_this.stop());
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      };
      return this.run_id = setInterval(update, 50);
    };

    Game.prototype.stop = function() {
      return clearInterval(this.run_id);
    };

    Game.prototype.pause = function() {
      if (this.status === 'RUNNING') {
        this.status = 'STOP';
        return this.stop();
      } else if (this.status === 'STOP') {
        this.status = 'RUNNING';
        return this.run();
      }
    };

    return Game;

  })();

  this.Game = Game;

}).call(this);
