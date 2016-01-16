
scene = new THREE.Scene()

## Camera

camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
camera.position.z = 200

## Renderer

renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.domElement)

## Objects

# donut
geometry = new THREE.TorusGeometry(50, 10, 16, 100)
material = new THREE.MeshBasicMaterial(color: 0xcccc00)
material.wireframe = true
donut = new THREE.Mesh(geometry, material)
scene.add(donut)

# electron
electrons = []
for size in [1..5]
  geometry = new THREE.SphereGeometry(size, 32, 32)
  material = new THREE.MeshBasicMaterial(color: 0xffff00)
  electron = new THREE.Mesh(geometry, material)
  electrons.push(electron)
  donut.add(electron)

# lines from hand
geometry = new THREE.CylinderGeometry(5, 5, 50, 16)
material = new THREE.MeshBasicMaterial(color: 0xffff00)
material.wireframe = true
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
donut.add(lines.left)
donut.add(lines.right)


## Light

ambientLight = new THREE.AmbientLight(0xaaaaaa)
scene.add(ambientLight)

## Rendering

theta = 0 * Math.PI / 180

render = ->
  theta += 1 * Math.PI / 180
  donut.rotation.x += 0.01
  donut.rotation.y += 0.01

  donutRadius = donut.geometry.parameters.radius
  donutTube   = donut.geometry.parameters.tube
  for i in [0...electrons.length]
    electron = electrons[i]
    eachTheta = theta + i / 10
    electron.position.set(
      Math.cos(eachTheta) * donutRadius
      Math.sin(eachTheta) * donutRadius + Math.sin(3 * eachTheta) * donutTube
                                          Math.cos(3 * eachTheta) * donutTube
    )

  requestAnimationFrame(render)  # continually invoke this
  renderer.render(scene, camera) # render scene

render()
