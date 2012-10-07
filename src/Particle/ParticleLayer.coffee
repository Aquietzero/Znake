# Particle Layer

class ParticleLayer

  constructor: (container, @width, @height) ->
    @canvas = document.createElement 'canvas'
    @canvas.id = 'ParticleCanvas'
    @canvas.width = width
    @canvas.height = height

    document.getElementById(container).appendChild(@canvas)

    @initCanvas()
    @initParticleSystem()

  initCanvas: ->
    @context = @canvas.getContext '2d'
    @context.fillStyle = 'rgba(0, 0, 0, 0)'
    @context.fillRect 0, 0, @width, @height

  initParticleSystem: ->
    @particleSystem = new ParticleSystem @context

  run: ->
    update = =>
      @particleSystem.evolve()

    @run_id = setInterval update, 100


@ParticleLayer = ParticleLayer
