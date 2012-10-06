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
    pos = { x: 80, y: 30 }
    @track_z = new Track @stage, dir, pos, @container, @width, @height
    @track_z.setActions Actions.Z
    @layers.push @track_z

    dir = { x: 0, y: -1 }
    pos = { x: 20, y: 42 }
    @track_n = new Track @stage, dir, pos, @container, @width, @height
    @track_n.setActions Actions.N
    @layers.push @track_n

    dir = { x: 0, y: -1 }
    pos = { x: 30, y: 38 }
    @track_a = new Track @stage, dir, pos, @container, @width, @height
    @track_a.setActions Actions.A
    @layers.push @track_a

    dir = { x: 0, y: 1 }
    pos = { x: 42, y: 10 }
    @track_k = new Track @stage, dir, pos, @container, @width, @height
    @track_k.setActions Actions.K
    @layers.push @track_k

    dir = { x: -1, y: 0 }
    pos = { x: 80, y: 33 }
    @track_e = new Track @stage, dir, pos, @container, @width, @height
    @track_e.setActions Actions.E
    @layers.push @track_e

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
