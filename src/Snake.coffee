# Snake

class Snake

  constructor: (@grid_size, @map, @context) ->

    @dir = { x: 0, y: -1 }
    @body = (new Grain 20, 20+i, @grid_size, @context for i in [0...7])
    console.log @body

  turn: (dir) ->
    switch dir
      when 'UP'    then new_dir = x: 0, y:-1
      when 'LEFT'  then new_dir = x:-1, y: 0
      when 'RIGHT' then new_dir = x: 1, y: 0
      when 'DOWN'  then new_dir = x: 0, y: 1

    @dir = new_dir unless @isOpposite @dir, new_dir

  move: ->
    head = @body[0]
    @body.unshift new Grain(head.x+@dir.x, head.y+@dir.y, @grid_size, @context)

    tail = @body.pop()
    tail.clear()

    @render()

  isOpposite: (dir, new_dir) ->
    console.log dir.y, new_dir.y
    dir.x + new_dir.x is 0 or dir.y + new_dir.y is 0
      
  render: ->
    @body[i].render("#{i+3}#{i+3}0000") for i in [0...@body.length]


@Snake = Snake
