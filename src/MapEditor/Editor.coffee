
class Editor extends Layer

  constructor: (@grid_size, container, width, height) ->
    super container, width, height

    @renderGrains()
    @renderGrid()

  renderGrid: ->
    @context.strokeStyle = '#000'

    @context.beginPath()
    for i in [0.5..@canvas.width] by @grid_size
      @context.moveTo i, 0
      @context.lineTo i, @canvas.height

    for i in [0.5..@canvas.height] by @grid_size
      @context.moveTo 0, i
      @context.lineTo @canvas.width, i
    @context.closePath()

    @context.stroke()

  renderGrains: ->
    @context.fillStyle = '#001'
    @context.fillRect 0, 0, @width, @height

  update: ->


@Editor = Editor
