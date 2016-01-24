
## Rendering

game = new this.game.Scene()
donut = game.objects.donut
electron = game.objects.electron

theta = 0 * Math.PI / 180

render = ->
  theta += 1 * Math.PI / 180

  donut.rotation.z = theta

  donutRadius = donut.geometry.parameters.radius
  donutTube   = donut.geometry.parameters.tube
  electron.position.x = Math.cos(3 * theta) * donutTube + donutRadius
  electron.position.z = Math.sin(3 * theta) * donutTube


  requestAnimationFrame(render)  # continually invoke this
  game.renderer.render(game.scene, game.camera) # render scene
  game.controls.update()

render()
