# Grain is an element of the grid.

class Grain

  # Grain is the basic element of a grid. Its position
  # is defined by the left-top corner.
  #
  # (x, y)
  #   |  
  #   |          
  #   `->┌───────┐ <---,
  #      │       │     │ 
  #      │       │      > size 
  #      │       │     │ 
  #      └───────┘ <---'
  #
  # TYPE
  #
  #   0: Valid grains in the map.
  #   1: Snake itself.
  #   2: Boundary in the map.
  #
  constructor: (@x, @y, @size, @type, @context) ->
    @value = 0

  setType: (type) ->
    @type = type

  isType: ->
    @type in arguments

  getColor: ->
    @value = 255 if @value > 255
    @value =   0 if @value <   0
    grey = Math.floor(@value).toString 16
    "##{grey}#{grey}#{grey}"

  reset: ->
    @setType Type.GROUND
    @render '#000000'

  render: (color) ->
    # Only the snake grain will pass the color. Otherwise, decide
    # the color according to the type of grain. 
    switch @type
      when Type.GROUND then color = @getColor()
      when Type.FOOD   then color = '#ffff00'

    @context.fillStyle = color
    @context.fillRect @x*@size+1, @y*@size+1, @size-1, @size-1


@Grain = Grain
