
class Brush extends Layer

  constructor: (@editor, container, width, height) ->
    super container, width, height

    @x
    @y
    @r = 50
    @v = 1
    @status = 'UP'
    @container = $ "##{@container}"

    @initEvents()

  initEvents: ->
    document.onmousemove = (event) =>
      @x = event.clientX - @container.offset().left
      @y = event.clientY - @container.offset().top
      @editor.setGrains @x, @y, @r, @v if @status is 'DOWN'

    document.onmousedown = (event) =>
      @status = 'DOWN'

    document.onmouseup = (event) =>
      @status = 'UP'

  shrink: ->
    @r-- if @r > 5

  enlarge: ->
    @r++ if @r < 100

  update: ->
    @context.clearRect 0, 0, @width, @height

    @context.strokeStyle = '#555555'
    @context.beginPath()
    @context.arc @x, @y, @r, 0, Math.PI * 2, true
    @context.closePath()
    @context.stroke()


@Brush = Brush
