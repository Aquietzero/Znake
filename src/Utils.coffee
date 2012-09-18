
Utils =
  random: (begin, end) ->
    Math.floor(begin + Math.random()*(end - begin))

  randomOne: ->
    -1 + Math.random() * 2


@Utils = Utils
