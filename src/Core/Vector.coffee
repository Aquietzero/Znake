
class Vector

  constructor: (@x, @y) ->

  add: (v) ->
    new Vector @x+v.x, @y+v.y

  sub: (v) ->
    new Vector @x-v.x, @y-v.y

  mul: (s) ->
    new Vector @x*s, @y*s

  floor: ->
    @x = Math.floor @x
    @y = Math.floor @y


@Vector = Vector
