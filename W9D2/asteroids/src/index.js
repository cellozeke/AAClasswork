const MovingObject = require('./moving_object.js');

document.addEventListener('DOMContentLoaded', function () {
window.MovingObject = MovingObject;

const canvasEl = document.getElementById('game-canvas')
const contx = canvasEl.getContext("2d");
console.log(contx)

// testing
const mo = new MovingObject({
    pos: [90, 90],
    vel: [10, 10],
    radius: 5,
    color: "#808080"
});

mo.draw(contx)

})
