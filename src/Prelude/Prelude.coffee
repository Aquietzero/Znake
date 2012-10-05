# Prelude of the game.

class Prelude

  constructor: (@container, @width, @height) ->
    @layers = []

    @initStage()
    @initTrack()

    @status = 'RUNNING'
    @initEvents()

  initStage: ->
    @stage = new Stage 10, @container, @width, @height
    @layers.push @stage

  initTrack: ->
    @track = new Track @stage, @container, @width, @height
    @layers.push @track

  initEvents: ->
    document.onkeydown = (event) =>
      switch event.keyCode
        when 32 then @pause()

  run: ->
    update = =>
      for layer in @layers
        layer.update()

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


@Prelude = Prelude