# Stage

class Stage extends Layer

  constructor: (@grid_size, container, width, height) ->
    super container, width, height

    @width  = @canvas.width  / @grid_size
    @height = @canvas.height / @grid_size

    @grains = {}
    for x in [0...@width]
      for y in [0...@height]
        @grains["#{x}-#{y}"] = new Grain x, y, @grid_size, Type.WATER, 0, @context

    @renderGrid()

  $: (x, y) ->
    @grains["#{x}-#{y}"]

  update: ->
    for index, grain of @grains
      grain.render()

  renderGrid: ->
    @context.strokeStyle = '#000000'

    @context.beginPath()
    for i in [0.5..@canvas.width] by @grid_size
      @context.moveTo i, 0
      @context.lineTo i, @canvas.height

    for i in [0.5..@canvas.height] by @grid_size
      @context.moveTo 0, i
      @context.lineTo @canvas.width, i
    @context.closePath()

    @context.stroke()


@Stage = Stage
