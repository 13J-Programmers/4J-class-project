"use strict";

// Rendering

var gameScene = new game.GameScene();
var donut = gameScene.objects.donut;
var electron = gameScene.objects.electron;

var theta = 0 * Math.PI / 180;

function render() {
    theta += 1 * Math.PI / 180;
    donut.rotation.z = theta;
    var donutRadius = donut.geometry.parameters.radius;
    var donutTube = donut.geometry.parameters.tube;

    electron.position.x = Math.cos(3 * theta) * donutTube + donutRadius;
    electron.position.z = Math.sin(3 * theta) * donutTube;

    requestAnimationFrame(render); // continually invoke this
    gameScene.renderer.render(gameScene.scene, gameScene.camera); // render scene
    gameScene.controls.update();
};

render();