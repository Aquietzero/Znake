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
    dir = { x: -1, y: 0 }
    pos = { x: 80, y: 40 }
    @track = new Track @stage, dir, pos, @container, @width, @height
    @track.setActions [
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'UP', 'RIGHT', 'UP', 'RIGHT', 'UP', 'RIGHT', 'UP', 'RIGHT'
      'UP', 'RIGHT', 'UP', 'RIGHT', 'UP', 'RIGHT', 'UP', 'RIGHT', 'UP'
      'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'LEFT'
      'REFRAIN'
    ]

    @layers.push @track

  initEvents: ->
    document.onkeydown = (event) =>
      switch event.keyCode
        when 38 then @track.turn('UP')
        when 39 then @track.turn('RIGHT')
        when 40 then @track.turn('DOWN')
        when 37 then @track.turn('LEFT')
        when 32 then @pause()

  run: ->
    update = =>
      # for layer in @layers
      #   layer.update()

      # This layer remove operation changes the relative order between
      # two layers.
      for i in [0...@layers.length]
        unless @layers[i].update()
          @layers[i] = @layers[@layers.length - 1]
          @layers.pop()

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
