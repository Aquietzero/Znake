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

  setType: (type) ->
    @type = type

  isType: ->
    @type in arguments

  reset: ->
    @setType Type.GROUND
    @render '#000000'

  render: (color) ->
    @context.fillStyle = color
    @context.fillRect @x*@size+1, @y*@size+1, @size-2, @size-2


@Grain = Grain
