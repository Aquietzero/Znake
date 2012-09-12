# Map

class Map

  constructor: (@grid_size, @context, @canvas) ->
    @width  = @canvas.width  / @grid_size
    @height = @canvas.height / @grid_size

    @map = []
    for i in [0...@height]
      @map.push (0 for j in [0...@width])

  # Map is consist of two parts, the first part is a grid
  # layout, the second part is the obstacles.
  render: ->
    @context.strokeStyle = '#111111'

    @context.beginPath()
    for i in [0..@canvas.width] by @grid_size
      @context.moveTo i, 0
      @context.lineTo i, @canvas.height

    for i in [0..@canvas.height] by @grid_size
      @context.moveTo 0, i
      @context.lineTo @canvas.width, i
    @context.closePath()

    @context.stroke()

@Map = Map
