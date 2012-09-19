# Basic Canvas Layer

class Layer

  constructor: (@container, @width, @height) ->
    @canvas = document.createElement 'canvas'
    @canvas.width = width
    @canvas.height = height

    document.getElementById(@container).appendChild(@canvas)

    @initCanvas()

  initCanvas: ->
    @context = @canvas.getContext '2d'
    @context.fillStyle = "rgba(0, 0, 0, 0)"
    @context.fillRect 0, 0, @width, @height

  update: ->


@Layer = Layer
