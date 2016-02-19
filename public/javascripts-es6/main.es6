
// Rendering

const game = new game.Scene();
const donut = game.objects.donut;
const electron = game.objects.electron;

let theta = 0 * Math.PI / 180;

function render() {
    theta += 1 * Math.PI / 180;
    donut.rotation.z = theta;
    const donutRadius = donut.geometry.parameters.radius;
    const donutTube = donut.geometry.parameters.tube;

    electron.position.x = Math.cos(3 * theta) * donutTube + donutRadius;
    electron.position.z = Math.sin(3 * theta) * donutTube;

    requestAnimationFrame(render); // continually invoke this
    game.renderer.render(game.scene, game.camera); // render scene
    game.controls.update();
};

render();
