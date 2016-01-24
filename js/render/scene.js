(function() {
  var Scene;

  this.game = this.game || {};

  this.game.Scene = Scene = (function() {
    Scene.scene;

    Scene.camera;

    Scene.renderer;

    Scene.controls;

    Scene.objects;

    function Scene() {
      this._initScene();
      this._initCamera();
      this._initRender();
      this._initControls();
      this._initLight();
      this._initObjects();
    }

    Scene.prototype._initScene = function() {
      return this.scene = new THREE.Scene();
    };

    Scene.prototype._initCamera = function() {
      this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
      return this.camera.position.z = 200;
    };

    Scene.prototype._initRender = function() {
      this.renderer = new THREE.WebGLRenderer();
      this.renderer.setSize(window.innerWidth, window.innerHeight);
      return document.body.appendChild(this.renderer.domElement);
    };

    Scene.prototype._initControls = function() {
      return this.controls = new THREE.OrbitControls(this.camera, this.renderer.domElement);
    };

    Scene.prototype._initLight = function() {
      var light;
      light = new THREE.DirectionalLight(0xffffff);
      light.position.set(0, 2, 1);
      return this.scene.add(light);
    };

    Scene.prototype._initObjects = function() {
      var donutRadius, geometry, lineLength, material;
      this.objects = {};
      this.objects.player = new THREE.Object3D();
      this.scene.add(this.objects.player);
      geometry = new THREE.TorusGeometry(30, 10, 16, 100);
      material = new THREE.MeshPhongMaterial({
        color: 0xaaffaa
      });
      this.objects.donut = new THREE.Mesh(geometry, material);
      this.objects.player.add(this.objects.donut);
      geometry = new THREE.SphereGeometry(5, 32, 32);
      material = new THREE.MeshPhongMaterial({
        color: 0xffff00
      });
      this.objects.electron = new THREE.Mesh(geometry, material);
      this.objects.donut.add(this.objects.electron);
      geometry = new THREE.CylinderGeometry(5, 5, 100, 16);
      material = new THREE.MeshPhongMaterial({
        color: 0xaaffaa
      });
      this.objects.lines = {};
      this.objects.lines.right = new THREE.Mesh(geometry, material);
      this.objects.lines.left = new THREE.Mesh(geometry, material);
      lineLength = this.objects.lines.right.geometry.parameters.height;
      donutRadius = this.objects.donut.geometry.parameters.radius;
      this.objects.lines.left.position.x = -(donutRadius + lineLength / 2);
      this.objects.lines.right.position.x = donutRadius + lineLength / 2;
      this.objects.lines.left.rotation.z = -90 * Math.PI / 180;
      this.objects.lines.right.rotation.z = 90 * Math.PI / 180;
      this.objects.player.add(this.objects.lines.left);
      this.objects.player.add(this.objects.lines.right);
      geometry = new THREE.PlaneGeometry(100, 10000);
      material = new THREE.MeshPhongMaterial({
        color: 0x8888ff,
        side: THREE.DoubleSide
      });
      this.objects.plane = new THREE.Mesh(geometry, material);
      this.objects.plane.position.z = -5000 + 100;
      this.objects.plane.position.y = -100;
      this.objects.plane.rotation.x = Math.PI / 2;
      return this.scene.add(this.objects.plane);
    };

    return Scene;

  })();

}).call(this);
