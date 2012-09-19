
class Editor extends Layer

  constructor: (@grid_size, container, width, height) ->
    super container, width, height

    @grains = {}
    for x in [0...@width]
      for y in [0...@height]
        @grains["#{x}-#{y}"] = 0

    @renderGrid()
    @renderGrains()

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

  setGrains: (x, y, r, val) ->
    x = Math.floor x/@grid_size
    y = Math.floor y/@grid_size
    offset = Math.floor r/@grid_size

    for i in [x-offset..x+offset]
      for j in [y-offset..y+offset]
        if (i-x)*(i-x) + (j-y)*(j-y) <= offset*offset
          @grains["#{i}-#{j}"] = val
          @context.fillStyle = @getColor i, j
          @context.fillRect i*@grid_size+1, j*@grid_size+1, @grid_size-1, @grid_size-1

  getColor: (x, y) ->
    value = @grains["#{x}-#{y}"]
    if value is 0
      '#001'
    else
      brown = Math.floor(value / 10 * 255).toString 16
      brown += brown if brown.length is 1
      "##{brown}#{brown}66"

  renderGrains: ->
    for x in [0...@width]
      for y in [0...@height]
        @context.fillStyle = @getColor x, y
        @context.fillRect x*@grid_size+1, y*@grid_size+1, @grid_size-1, @grid_size-1

  log: ->
    map = []
    for y in [0...@height/@grid_size]
      line = (@grains["#{x}-#{y}"] for x in [0...@width/@grid_size]).join ''
      map.push line
    map = map.join '\n'
    console.log map

  update: ->
    # @renderGrains()


@Editor = Editor
