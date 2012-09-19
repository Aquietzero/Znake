
class Panel
  
  constructor: (@brush) ->
    @container = $ '#panel'

    @values = $ '.heightValue'

    @initColors()
    @initEvents()

  initColors: ->
    getColor = (index) ->
      c = Math.floor(index/10*255).toString 16
      c += c if c.length is 1
      "##{c}#{c}66"

    $(value).css backgroundColor: "#{getColor i+1}" for value, i in @values

  initEvents: ->
    for value, i in @values
      $(value).click ((i) =>
        => @brush.v = i+1
      )(i)


@Panel = Panel
