# Track

class Track extends Layer

  constructor: (@map, @origin_dir, @origin_pos, @color, container, width, height) ->
    super container, width, height

    @red   = parseInt @color[0], 16
    @green = parseInt @color[1], 16
    @blue  = parseInt @color[2], 16

    @setBody()

  setActions: (actions) ->
    @actions = actions
    @frame = 0

  setBody: ->
    @dir = @origin_dir
    x = @origin_pos.x
    y = @origin_pos.y

    @body = []
    for i in [0...7]
      @body.push new Grain x+i*@dir.x, y+i*@dir.y, @map.grid_size, 0, Type.SNAKE, @context

  head: ->
    @body[0]

  turn: (dir) ->
    switch dir
      when 'UP'    then new_dir = x :  0, y : -1
      when 'LEFT'  then new_dir = x : -1, y :  0
      when 'RIGHT' then new_dir = x :  1, y :  0
      when 'DOWN'  then new_dir = x :  0, y :  1

    @dir = new_dir

  move: ->
    head = @body[0]
    next_pos = x: head.x + @dir.x, y: head.y + @dir.y

    # Circulate movements.
    next_pos.x = @map.width - 1 if next_pos.x is -1
    next_pos.x = 0 if next_pos.x is @map.width
    next_pos.y = @map.height - 1 if next_pos.y is -1
    next_pos.y = 0 if next_pos.y is @map.height
    
    tail = @body.pop()

    new_head = new Grain next_pos.x, next_pos.y, @map.grid_size, Type.SNAKE, 0, @context
    @body.unshift new_head
    true

  render: ->
    for i in [0...@body.length]
      red = Math.floor(@red - @red * i / 1.5 / @body.length).toString 16
      red += red if red.length is 1

      green = Math.floor(@green - @green * i / 1.5 / @body.length).toString 16
      green += green if green.length is 1

      blue = Math.floor(@blue - @blue * i / 1.5 / @body.length).toString 16
      blue += blue if blue.length is 1

      @body[i].render "#{red}#{green}#{blue}"

  update: ->
    if @actions[@frame] is 'REFRAIN'
      @frame = 0
      @setBody()
    @turn @actions[@frame] if @frame < @actions.length
    @frame++
      
    @move()
    @render()


@Track = Track
