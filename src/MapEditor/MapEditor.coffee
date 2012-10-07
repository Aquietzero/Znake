
class MapEditor

  constructor: (@container, @width, @height) ->
    @layers = []

    @initEditor()
    @initBrush()
    @initPanel()

    @initEvents()

  initEditor: ->
    @editor = new Editor 10, @container, @width, @height
    @layers.push @editor

  initBrush: ->
    @brush = new Brush @editor, @container, @width, @height
    @layers.push @brush

  initPanel: ->
    @panel = new Panel @brush

  initEvents: ->
    document.onkeydown = (event) =>
      switch event.keyCode
        when 219 then @brush.shrink()
        when 221 then @brush.enlarge()

    $("#submit").click =>
      @editor.log()

  run: ->
    update = =>
      layer.update() for layer in @layers

    @run_id = setInterval update, 30

  stop: ->
    clearInterval @run_id


@MapEditor = MapEditor
