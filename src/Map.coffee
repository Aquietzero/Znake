# Map

class Map

  # Since the coordinate of the canvas and the arrangement of the map
  # array is quite different, so I decided not to use a 2-d array to 
  # represent the map. Instead, I used an object whose keys are defined
  # by the grain coordinate. If the coordinate of a grain is (x, y),
  # then its key will be "x-y".
  constructor: (@grid_size, @context, @canvas) ->
    @width  = @canvas.width  / @grid_size
    @height = @canvas.height / @grid_size

    @grains = {}
    for x in [0...@width]
      for y in [0...@height]
        @grains["#{x}-#{y}"] = new Grain x, y, @grid_size, Type.GROUND, @context

  # Returns the specific grain through its x, y coordinate.
  $: (x, y) ->
    @grains["#{x}-#{y}"]

  isContain: (x, y) ->
    (0 <= x or x < @width) and (0 <= y or y < @height)

  generateFood: ->
    ground = (grain for index, grain of @grains when grain.isType Type.GROUND)
    food   = ground[Utils.random(0, ground.length)]
    food.setType Type.FOOD
    food.render '#ffff00'

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
    grain.render('#000000') for index, grain of @grains


@Map = Map
