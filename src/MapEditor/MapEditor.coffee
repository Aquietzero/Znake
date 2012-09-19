
class MapEditor

  constructor: (@container, @width, @height) ->
    @layers = []

    @initEditor()
    @initBrush()

    @initEvents()

  initEditor: ->
    @editor = new Editor 10, @container, @width, @height
    @layers.push @editor

  initBrush: ->
    @brush = new Brush @container, @width, @height
    @layers.push @brush

  initEvents: ->
    document.onkeydown = (event) =>
      # switch event.keyCode

  run: ->
    update = =>
      layer.update() for layer in @layers

    @run_id = setInterval update, 30

  stop: ->
    clearInterval @run_id


@MapEditor = MapEditor
