# Snake

class Snake

  constructor: (@map, @context) ->

    @dir = { x: 0, y: -1 }
    @body = []
    for i in [0...7]
      grain = @map.$ 20, 20+i
      grain.setType Type.SNAKE
      @body.push grain

  head: ->
    @body[0]

  # If the new direction is the opposite of the current direction,
  # then turning is not allowed.
  isValidToTurn: (new_dir) ->
    @dir.x + new_dir.x is 0 or @dir.y + new_dir.y is 0

  isValidToMove: (pos) ->
    return false unless @map.$(pos.x, pos.y)?.isType Type.GROUND, Type.FOOD
    true

  ateFood: (pos) ->
    unless @map.$(pos.x, pos.y)?.isType Type.FOOD
      false
    else
      food = @map.$(pos.x, pos.y)
      food.reset()
      @map.generateFood()
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
    next_pos = x: head.x+@dir.x, y: head.y+@dir.y
    
    unless @isValidToMove next_pos
      false
    else
      # If eats something, then grow some length.
      unless @ateFood next_pos
        tail = @body.pop()
        tail.reset()

      new_head = @map.$ next_pos.x, next_pos.y
      new_head.setType Type.SNAKE
      @body.unshift new_head

      @render()
      true

  vibrate: ->
    @body[i].value += 3 for i in [0...4]

  render: ->
    for i in [0...@body.length]
      red_degree = Math.floor(9 - 9 * i/@body.length)
      @body[i].render "#{red_degree}#{red_degree}0000"


@Snake = Snake
