
window.game = window.game || {}
window.game.GameScene =

class GameScene {
    constructor() {
        // init scene
        this.scene = new THREE.Scene();

        // init camera
        this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 1, 10000);
        this.camera.position.z = 200;

        // init render
        this.renderer = new THREE.WebGLRenderer();
        this.renderer.setSize(window.innerWidth, window.innerHeight);
        document.body.appendChild(this.renderer.domElement);

        // init controls
        this.controls = new THREE.OrbitControls(this.camera, this.renderer.domElement);

        // init light
        const light = new THREE.DirectionalLight(0xffffff);
        light.position.set(0, 2, 1);
        this.scene.add(light);

        // init objects
        this.objects = {};
        let geometry, material;

        // player
        this.objects.player = new THREE.Object3D();
        this.scene.add(this.objects.player);

        // donut
        geometry = new THREE.TorusGeometry(30, 10, 16, 100);
        material = new THREE.MeshPhongMaterial({ color: 0xaaffaa });
        this.objects.donut = new THREE.Mesh(geometry, material);
        this.objects.player.add(this.objects.donut);

        // electron
        geometry = new THREE.SphereGeometry(5, 32, 32);
        material = new THREE.MeshPhongMaterial({ color: 0xffff00 });
        this.objects.electron = new THREE.Mesh(geometry, material);
        this.objects.donut.add(this.objects.electron);

        // lines from hand
        geometry = new THREE.CylinderGeometry(5, 5, 100, 16);
        material = new THREE.MeshPhongMaterial({ color: 0xaaffaa });
        this.objects.lines = {};
        this.objects.lines.right = new THREE.Mesh(geometry, material);
        this.objects.lines.left  = new THREE.Mesh(geometry, material);
        const lineLength  = this.objects.lines.right.geometry.parameters.height;
        const donutRadius = this.objects.donut.geometry.parameters.radius;
        this.objects.lines.left.position.x  = -(donutRadius + lineLength/2);
        this.objects.lines.right.position.x =   donutRadius + lineLength/2;
        this.objects.lines.left.rotation.z  = -90 * Math.PI / 180;
        this.objects.lines.right.rotation.z =  90 * Math.PI / 180;
        this.objects.player.add(this.objects.lines.left);
        this.objects.player.add(this.objects.lines.right);

        // ground
        geometry = new THREE.PlaneGeometry(100, 10000);
        material = new THREE.MeshPhongMaterial({
            color: 0x8888ff,
            side: THREE.DoubleSide,
        });
        this.objects.plane = new THREE.Mesh(geometry, material);
        this.objects.plane.position.z = -5000 + 100;
        this.objects.plane.position.y = -100;
        this.objects.plane.rotation.x = Math.PI / 2;
        this.scene.add(this.objects.plane);
    }
}
