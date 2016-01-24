
this.game = this.game || {}
this.game.Scene =
  class Scene
    @scene
    @camera
    @renderer
    @controls
    @objects

    constructor: ->
      ## Scene
      this._initScene()
      this._initCamera()
      this._initRender()
      this._initControls()
      this._initLight()
      ## Objects
      this._initObjects()

    _initScene: ->
      @scene = new THREE.Scene()

    _initCamera: ->
      @camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000)
      @camera.position.z = 200

    _initRender: ->
      @renderer = new THREE.WebGLRenderer()
      @renderer.setSize(window.innerWidth, window.innerHeight)
      document.body.appendChild(@renderer.domElement)

    _initControls: ->
      @controls = new THREE.OrbitControls(@camera, @renderer.domElement)

    _initLight: ->
      light = new THREE.DirectionalLight(0xffffff)
      light.position.set(0, 2, 1)
      @scene.add(light)

    _initObjects: ->
      @objects = {}

      # player
      @objects.player = new THREE.Object3D()
      @scene.add(@objects.player)

      # donut
      geometry = new THREE.TorusGeometry(30, 10, 16, 100)
      material = new THREE.MeshPhongMaterial(color: 0xaaffaa)
      @objects.donut = new THREE.Mesh(geometry, material)
      @objects.player.add(@objects.donut)

      # electron
      geometry = new THREE.SphereGeometry(5, 32, 32)
      material = new THREE.MeshPhongMaterial(color: 0xffff00)
      @objects.electron = new THREE.Mesh(geometry, material)
      @objects.donut.add(@objects.electron)

      # lines from hand
      geometry = new THREE.CylinderGeometry(5, 5, 100, 16)
      material = new THREE.MeshPhongMaterial(color: 0xaaffaa)
      @objects.lines = {}
      @objects.lines.right = new THREE.Mesh(geometry, material)
      @objects.lines.left  = new THREE.Mesh(geometry, material)
      lineLength  = @objects.lines.right.geometry.parameters.height
      donutRadius = @objects.donut.geometry.parameters.radius
      @objects.lines.left.position.x  = -(donutRadius + lineLength/2)
      @objects.lines.right.position.x = donutRadius + lineLength/2
      @objects.lines.left.rotation.z  = -90 * Math.PI / 180
      @objects.lines.right.rotation.z = 90 * Math.PI / 180
      @objects.player.add(@objects.lines.left)
      @objects.player.add(@objects.lines.right)

      # ground
      geometry = new THREE.PlaneGeometry(100, 10000)
      material = new THREE.MeshPhongMaterial(
        color: 0x8888ff
        side: THREE.DoubleSide
      )
      @objects.plane = new THREE.Mesh(geometry, material)
      @objects.plane.position.z = -5000 + 100
      @objects.plane.position.y = -100
      @objects.plane.rotation.x = Math.PI / 2
      @scene.add(@objects.plane)
