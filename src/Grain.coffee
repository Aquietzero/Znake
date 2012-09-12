# Grain is an element of the grid.

class Grain

  # Grain is the basic element of a grid. Its position
  # is defined by the left-top corner.
  #
  # (x, y)
  #   |  
  #   |          
  #   `->┌──────┐---,
  #      │      │   |
  #      │      │ size 
  #      │      │   |
  #      └──────┘---'
  constructor: (@x, @y, @size, @context) ->

  clear: ->
    @render '#000000'

  render: (color) ->
    @context.fillStyle = color
    @context.fillRect @x*@size+1, @y*@size+1, @size-2, @size-2


@Grain = Grain
