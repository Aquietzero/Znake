# Number board for showing the score, the distance and the 
# number of beans the snake ates.

class NumberBoard extends Layer

  constructor: (container, width, height) ->
    super

    @value = 0
    @numbers = []
    @initNumbers()

  initNumbers: ->
    @numbers.push new Number(digit, 0, @context) for digit in [0...3]

  setNumbers: ->
    # Padding
    val = @value.toString()
    val = "00#{val}" if val.length is 1
    val = "0#{val}" if val.length is 2

    @numbers[digit].set val[digit] for digit in [0...3]

  increase: ->
    @value++
    @setNumbers()

  update: ->
    true

@NumberBoard = NumberBoard
