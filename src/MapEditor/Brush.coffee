
class Brush extends Layer

  constructor: (container, width, height) ->
    super container, width, height

    @x
    @y
    @r = 50
    @status = 'UP'
    @container = $ '#' + @container

    @initEvents()

  initEvents: ->
    document.onmousemove = (event) =>
      @x = event.clientX - @container.offset().left
      @y = event.clientY - @container.offset().top

    document.onmousedown = (event) =>
      @status = 'DOWN'

    document.onmouseup = (event) =>
      @status = 'UP'

  update: ->
    @context.clearRect 0, 0, @width, @height

    @context.strokeStyle = '#555555'
    @context.beginPath()
    @context.arc @x, @y, @r, 0, Math.PI * 2, true
    @context.closePath()
    @context.stroke()


@Brush = Brush
