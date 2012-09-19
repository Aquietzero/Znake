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
  constructor: (@x, @y, @size, @type, @value, @context) ->

  setType: (type) ->
    @type = type

  isType: ->
    @type in arguments

  getWaterColor: ->
    if @value > 2
      @value = 255 if @value > 255
      @value =   0 if @value <   0
      blue = Math.floor(@value).toString 16
      blue += blue if blue.length is 1
      green = Math.floor(@value / 4).toString 16
      green += green if green.length is 1
      "##{green}00#{blue}"
    else
      '#000011'

  getMountainColor: ->
    brown = Math.floor(@value / 9 * 255).toString 16
    brown += brown if brown.length is 1
    "##{brown}#{brown}33"

  # Reset is basically used by snake since the water keeps flowing.
  reset: ->
    @context.clearRect @x*@size+1, @y*@size+1, @size-1, @size-1

  render: (color) ->
    # Only the snake grain will pass the color. Otherwise, decide
    # the color according to the type of grain. 
    switch @type
      when Type.WATER    then color = @getWaterColor()
      when Type.FOOD     then color = '#ffff00'
      when Type.MOUNTAIN then color = @getMountainColor()

    @context.fillStyle = color
    @context.fillRect @x*@size+1, @y*@size+1, @size-1, @size-1


@Grain = Grain
