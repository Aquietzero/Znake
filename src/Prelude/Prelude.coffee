# Prelude of the game.

class Prelude

  constructor: (@container, @width, @height) ->
    @layers = []

    @initStage()
    @initTracks()

  initStage: ->
    @stage = new Stage 10, @container, @width, @height
    @layers.push @stage

  initTracks: ->
    dir = { x: -1, y: 0 }
    pos = { x: 80, y: 30 }
    @track_z = new Track @stage, dir, pos, 'fc0', @container, @width, @height
    @track_z.setActions Actions.Z

    dir = { x: 0, y: -1 }
    pos = { x: 20, y: 42 }
    @track_n = new Track @stage, dir, pos, 'f90', @container, @width, @height
    @track_n.setActions Actions.N

    dir = { x: 0, y: -1 }
    pos = { x: 30, y: 38 }
    @track_a = new Track @stage, dir, pos, 'f63', @container, @width, @height
    @track_a.setActions Actions.A

    dir = { x: 0, y: 1 }
    pos = { x: 42, y: 10 }
    @track_k = new Track @stage, dir, pos, 'f30', @container, @width, @height
    @track_k.setActions Actions.K

    dir = { x: -1, y: 0 }
    pos = { x: 80, y: 33 }
    @track_e = new Track @stage, dir, pos, 'f33', @container, @width, @height
    @track_e.setActions Actions.E

    @layers.push @track_z
    @layers.push @track_n
    @layers.push @track_a
    @layers.push @track_k
    @layers.push @track_e

  run: ->
    update = =>
      # This layer remove operation changes the relative order between
      # two layers.
      layer.update() for layer in @layers

    @run_id = setInterval update, 20

  stop: ->
    clearInterval @run_id


@Prelude = Prelude
