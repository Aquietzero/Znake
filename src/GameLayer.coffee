# Game Layer

class GameLayer

  constructor: (container, @width, @height) ->
    @canvas = document.createElement 'canvas'
    @canvas.id = 'GameCanvas'
    @canvas.width = width
    @canvas.height = height

    document.getElementById(container).appendChild(@canvas)

    @initCanvas()
    @initMap()
    @initSnake()

    @status = 'RUNNING'
    @initEvents()

  initCanvas: ->
    @context = @canvas.getContext '2d'
    @context.fillStyle = '#000000'
    @context.fillRect 0, 0, @width, @height

  initMap: ->
    @map = new Map 10, @context, @canvas
    # GenerateFood for the first time.
    @map.generateFood()
    @map.render()

  initSnake: ->
    @snake = new Snake @map, @context
    @snake.render()

  initEvents: ->
    document.onkeydown = (event) =>
      switch event.keyCode
        when 38 then @snake.turn('UP')
        when 39 then @snake.turn('RIGHT')
        when 40 then @snake.turn('DOWN')
        when 37 then @snake.turn('LEFT')
        when 32 then @pause()

  run: ->
    update = =>
      @map.render()
      unless @snake.move()
        alert 'Game Over'
        @stop()

    @run_id = setInterval update, 30

  stop: ->
    clearInterval @run_id

  pause: ->
    if @status is 'RUNNING'
      @status = 'STOP'
      @stop()
    else if @status is 'STOP'
      @status = 'RUNNING'
      @run()



@GameLayer = GameLayer
