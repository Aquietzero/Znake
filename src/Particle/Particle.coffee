
class Particle

  constructor: (@pos, @size, @life, @context) ->
    @x = 0
    @y = 0
    @age = 0
    @velocity = new Vector(Utils.randomOne(), Utils.randomOne())

  evolve: ->
    @age++
    @render()

  isDead: ->
    @age > @life

  clear: ->
    dist = @velocity.mul @age
    loc  = @pos.add dist
    loc.floor()
    x = loc.x * @size
    y = loc.y * @size

    @context.fillStyle = "rgba(0, 0, 0, 0)"
    @context.fillRect x+1, y+1, @size-1, @size-1

  render: ->
    # Clear
    @context.fillStyle = "rgba(0, 0, 0, 0.1)"
    @context.fillRect @x+1, @y+1, @size-1, @size-1

    dist = @velocity.mul @age
    loc  = @pos.add dist
    loc.floor()
    @x = loc.x * @size
    @y = loc.y * @size
    opacity = 1 - @age / @life

    @context.fillStyle = "rgba(100, 100, 0, #{opacity})"
    @context.fillRect @x+1, @y+1, @size-1, @size-1


@Particle = Particle
