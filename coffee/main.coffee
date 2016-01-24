
# console.log this.game # => Object {scene: "hello, world!...", class: "hello, world!..."}

scene = new THREE.Scene()

## Camera

camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000)
camera.position.z = 200

## Renderer

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.domElement)

## Controles

controls = new THREE.OrbitControls(camera, renderer.domElement)

## Objects

# player
player = new THREE.Object3D()
scene.add(player)

# donut
geometry = new THREE.TorusGeometry(30, 10, 16, 100)
material = new THREE.MeshPhongMaterial(color: 0xaaffaa)
donut = new THREE.Mesh(geometry, material)
player.add(donut)

# electron
geometry = new THREE.SphereGeometry(5, 32, 32)
material = new THREE.MeshPhongMaterial(color: 0xffff00)
electron = new THREE.Mesh(geometry, material)
donut.add(electron)

# lines from hand
geometry = new THREE.CylinderGeometry(5, 5, 100, 16)
material = new THREE.MeshPhongMaterial(color: 0xaaffaa)
lines =
  right:
    new THREE.Mesh(geometry, material)
  left:
    new THREE.Mesh(geometry, material)
lineLength  = lines.right.geometry.parameters.height
donutRadius = donut.geometry.parameters.radius
lines.left.position.x  = -(donutRadius + lineLength/2)
lines.right.position.x = donutRadius + lineLength/2
lines.left.rotation.z  = -90 * Math.PI / 180
lines.right.rotation.z = 90 * Math.PI / 180
player.add(lines.left)
player.add(lines.right)

# ground
geometry = new THREE.PlaneGeometry(100, 10000)
material = new THREE.MeshPhongMaterial(
  color: 0x8888ff
  side: THREE.DoubleSide
)
plane = new THREE.Mesh(geometry, material)
plane.position.z = -5000 + 100
plane.position.y = -100
plane.rotation.x = Math.PI / 2
scene.add(plane)

## Light

light = new THREE.DirectionalLight(0xffffff)
light.position.set(0, 2, 1)
scene.add(light)

## Rendering

theta = 0 * Math.PI / 180

render = ->
  theta += 1 * Math.PI / 180

  donut.rotation.z = theta

  donutRadius = donut.geometry.parameters.radius
  donutTube   = donut.geometry.parameters.tube
  electron.position.x = Math.cos(3 * theta) * donutTube + donutRadius
  electron.position.z = Math.sin(3 * theta) * donutTube


  requestAnimationFrame(render)  # continually invoke this
  renderer.render(scene, camera) # render scene
  controls.update()

render()
