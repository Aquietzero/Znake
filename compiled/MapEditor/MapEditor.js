// Generated by CoffeeScript 1.3.3
(function() {
  var MapEditor;

  MapEditor = (function() {

    function MapEditor(container, width, height) {
      this.container = container;
      this.width = width;
      this.height = height;
      this.layers = [];
      this.initEditor();
      this.initBrush();
      this.initEvents();
    }

    MapEditor.prototype.initEditor = function() {
      this.editor = new Editor(10, this.container, this.width, this.height);
      return this.layers.push(this.editor);
    };

    MapEditor.prototype.initBrush = function() {
      this.brush = new Brush(this.container, this.width, this.height);
      return this.layers.push(this.brush);
    };

    MapEditor.prototype.initEvents = function() {
      var _this = this;
      return document.onkeydown = function(event) {};
    };

    MapEditor.prototype.run = function() {
      var update,
        _this = this;
      update = function() {
        var layer, _i, _len, _ref, _results;
        _ref = _this.layers;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          layer = _ref[_i];
          _results.push(layer.update());
        }
        return _results;
      };
      return this.run_id = setInterval(update, 30);
    };

    MapEditor.prototype.stop = function() {
      return clearInterval(this.run_id);
    };

    return MapEditor;

  })();

  this.MapEditor = MapEditor;

}).call(this);