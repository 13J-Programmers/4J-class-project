"use strict";

// Rendering

var game = new game.Scene();
var donut = game.objects.donut;
var electron = game.objects.electron;

var theta = 0 * Math.PI / 180;

function render() {
    theta += 1 * Math.PI / 180;
    donut.rotation.z = theta;
    var donutRadius = donut.geometry.parameters.radius;
    var donutTube = donut.geometry.parameters.tube;

    electron.position.x = Math.cos(3 * theta) * donutTube + donutRadius;
    electron.position.z = Math.sin(3 * theta) * donutTube;

    requestAnimationFrame(render); // continually invoke this
    game.renderer.render(game.scene, game.camera); // render scene
    game.controls.update();
};

render();