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

    @initEvents()

  initCanvas: ->
    @context = @canvas.getContext '2d'
    @context.fillStyle = '#000000'
    @context.fillRect 0, 0, @width, @height

  initMap: ->
    @map = new Map 20, @context, @canvas
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

  run: ->
    update = =>
      alert 'Game Over!' unless @snake.move()

    setInterval update, 500


@GameLayer = GameLayer
