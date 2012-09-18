
class ParticleSystem

  constructor: (@context, config) ->
    rand_x = Utils.random(100, 700)
    rand_y = Utils.random(100, 700)

    @pos  = new Vector 40, 30
    @size = 10
    @life = 5
    @num  = 50
    @configure config
    
    @particles = (new Particle(@pos, @size, @life, @context) for i in [0...@num])

  evolve: ->
    for particle, i in @particles
      particle.evolve()
      if particle.isDead()
        particle.clear()
        @kill i
        @particles.push new Particle(@pos, @size, @life, @context)

  kill: (index) ->
    @particles[index] = @particles[@particles.length - 1]
    @particles.pop()

  configure: (config) ->
    @[key] = val for key, val of config when @hasOwnProperty key


@ParticleSystem = ParticleSystem
