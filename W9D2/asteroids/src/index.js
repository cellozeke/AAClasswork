const MovingObject = require('./moving_object.js');

document.addEventListener('DOMContentLoaded', function () {
window.MovingObject = MovingObject;

const canvasEl = document.getElementById('game-canvas')
const contx = canvasEl.getContext("2d");
console.log(contx)

// testing
const mo = new MovingObject({
    pos: [100, 100],
    vel: [100, 100],
    radius: 50,
    color: "#808080"
});

mo.draw(contx);
setTimeout(mo.move(), 5000);
setTimeout(mo.draw(contx), 5000);

});
