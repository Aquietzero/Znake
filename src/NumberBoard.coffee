# Number board for showing the score, the distance and the 
# number of beans the snake ates.

class NumberBoard extends Layer

  constructor: (container, width, height) ->
    super

    @value = 0
    @numbers = []
    @initNumbers()

  initNumbers: ->
    @numbers.push new Number(digit, 0) for digit in [0...3]

  setNumbers: ->
    @numbers[digit].set @value[digit] for digit in [0...3]

  increase: ->
    @value++
    @setNumbers()

@NumberBoard = NumberBoard
