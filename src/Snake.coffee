# Snake

class Snake extends Layer

  constructor: (@map, @numberBoard, container, width, height) ->
    super container, width, height

    @dir = { x: 0, y: -1 }
    @body = (new Grain 20, 50+i, @map.grid_size, 0, Type.SNAKE, @context for i in [0...7])

  head: ->
    @body[0]

  # If the new direction is the opposite of the current direction,
  # then turning is not allowed.
  isValidToTurn: (new_dir) ->
    @dir.x + new_dir.x is 0 or @dir.y + new_dir.y is 0

  isValidToMove: (pos) ->
    unless @map.$(pos.x, pos.y)?.isType Type.WATER, Type.FOOD
      false
    else
      for el in @body
        return false if el.x is pos.x and el.y is pos.y
      true

  ateFood: (pos) ->
    unless @map.$(pos.x, pos.y)?.isType Type.FOOD
      false
    else
      @map.deleteFood pos.x, pos.y
      @map.generateFood()
      @numberBoard.increase()
      true

  turn: (dir) ->
    switch dir
      when 'UP'    then new_dir = x :  0, y : -1
      when 'LEFT'  then new_dir = x : -1, y :  0
      when 'RIGHT' then new_dir = x :  1, y :  0
      when 'DOWN'  then new_dir = x :  0, y :  1

    @dir = new_dir unless @isValidToTurn new_dir

  move: ->
    @vibrate()

    head = @body[0]
    next_pos = x: head.x + @dir.x, y: head.y + @dir.y

    # Circulate movements.
    next_pos.x = @map.width - 1 if next_pos.x is -1
    next_pos.x = 0 if next_pos.x is @map.width
    next_pos.y = @map.height - 1 if next_pos.y is -1
    next_pos.y = 0 if next_pos.y is @map.height
    
    unless @isValidToMove next_pos
      false
    else
      # If eats something, then grow some length.
      unless @ateFood next_pos
        tail = @body.pop()
        tail.reset()
        @map.$(tail.x, tail.y).value = 0

      new_head = new Grain next_pos.x, next_pos.y, @map.grid_size, Type.SNAKE, 0, @context
      @body.unshift new_head
      true

  vibrate: ->
    @map.$(el.x, el.y).value += 3 for el, i in @body when i < 6

  render: ->
    for i in [0...@body.length]
      red = Math.floor(15 - 15 * i / @body.length).toString 16
      red += red if red.length is 1
      @body[i].render "#{red}0000"

  update: ->
    unless @move()
      alert 'Game Over'
      false
    else
      @render()


@Snake = Snake
