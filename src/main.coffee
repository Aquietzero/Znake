
window.onload = ->
  # znake = new Game 'GameLayer', 800, 600
  # znake.run()
  prelude = new Prelude 'GameLayer', 800, 600
  prelude.run()

  document.onkeydown = (event) =>
    prelude.stop()
    znake = new Game 'GameLayer', 800, 600
    znake.run()
