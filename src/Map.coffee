# Map

class Map

  # The 2-d array of the map is like the following, in which the x, y represents
  # the x, y, coordinates in each grain.
  #
  #   [ grain(0, 0), grain(1, 0), ... grain(w, 0) ]
  #   [ grain(0, 1), grain(1, 1), ... grain(w, 1) ]
  #         :            :                :
  #         :            :                :
  #         :            :                :
  #   [ grain(0, h), grain(1, h), ... grain(w, h) ]
  #
  # The coordinate may look a little strange, that's because of the conflict
  # between the coordinate system of canvas and the coordinate system defined by
  # the 2-d array of the map.
  constructor: (@grid_size, @context, @canvas) ->
    @width  = @canvas.width  / @grid_size
    @height = @canvas.height / @grid_size

    @grains = {}
    for x in [0...@width]
      for y in [0...@height]
        @grains["#{x}-#{y}"] = new Grain x, y, @grid_size, 0, @context

  $: (x, y) ->
    @grains["#{x}-#{y}"]

  isContain: (x, y) ->
    (0 <= x or x < @width) and (0 <= y or y < @height)

  # Map is consist of two parts, the first part is a grid
  # layout, the second part is the obstacles.
  render: ->
    @renderGrid()
    @renderGrains()

  renderGrid: ->
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

  renderGrains: ->
    grain.render('#000033') for index, grain of @grains


@Map = Map
