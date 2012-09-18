# Basic Game Controller

class Game

  constructor: (@container, @width, @height) ->
    @layers = []

    @initMap()
    @initSnake()

    @status = 'RUNNING'
    @initEvents()

  initMap: ->
    @map = new Map 10, @container, @width, @height
    @map.generateFood()
    @layers.push @map

  initSnake: ->
    @snake = new Snake @map, @container, @width, @height
    @layers.push @snake

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
      layer.update() for layer in @layers

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


@Game = Game
