# Snake

class Snake

  constructor: (@map, @context) ->

    @dir = { x: 0, y: -1 }
    @body = []
    for i in [0...7]
      grain = @map.$ 20, 20+i
      grain.type = 1
      @body.push grain

  head: ->
    @body[0]

  turn: (dir) ->
    switch dir
      when 'UP'    then new_dir = x :  0, y : -1
      when 'LEFT'  then new_dir = x : -1, y :  0
      when 'RIGHT' then new_dir = x :  1, y :  0
      when 'DOWN'  then new_dir = x :  0, y :  1

    @dir = new_dir unless @isValidToTurn new_dir

  move: ->
    head = @body[0]
    
    unless @isValidToMove head
      false
    else
      new_head = @map.$ head.x+@dir.x, head.y+@dir.y
      new_head.type = 1
      @body.unshift new_head

      tail = @body.pop()
      tail.type = 0
      tail.clear()

      @render()
      true

  # If the new direction is the opposite of the current direction,
  # then turning is not allowed.
  isValidToTurn: (new_dir) ->
    @dir.x + new_dir.x is 0 or @dir.y + new_dir.y is 0

  isValidToMove: (head) ->
    next_pos = x: head.x+@dir.x, y: head.y+@dir.y

    unless @map.$(next_pos.x, next_pos.y)?.type is 0 then return false
    true

  render: ->
    @body[i].render("#{i+4}#{i+4}0000") for i in [0...@body.length]


@Snake = Snake
