
// Rendering

const gameScene = new game.GameScene();
const donut = gameScene.objects.donut;
const electron = gameScene.objects.electron;

let theta = 0 * Math.PI / 180;

function render() {
    theta += 1 * Math.PI / 180;
    donut.rotation.z = theta;
    const donutRadius = donut.geometry.parameters.radius;
    const donutTube = donut.geometry.parameters.tube;

    electron.position.x = Math.cos(3 * theta) * donutTube + donutRadius;
    electron.position.z = Math.sin(3 * theta) * donutTube;

    requestAnimationFrame(render); // continually invoke this
    gameScene.renderer.render(gameScene.scene, gameScene.camera); // render scene
    gameScene.controls.update();
};

render();
