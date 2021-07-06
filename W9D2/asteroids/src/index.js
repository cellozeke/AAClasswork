const Asteroid = require('./asteroid.js');
const MovingObject = require('./moving_object.js');


document.addEventListener('DOMContentLoaded', function () {
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;

const canvasEl = document.getElementById('game-canvas')
const contx = canvasEl.getContext("2d");
console.log(contx)

// testing
// const mo = new MovingObject({
//     pos: [100, 100],
//     vel: [100, 100],
//     radius: 25,
//     color: "#808080"
// });


// mo.draw(contx);
// setTimeout(mo.move(), 5000);
// setTimeout(mo.draw(contx), 5000);

let aster1 = new Asteroid({ pos: [30, 30] });
aster1.draw(contx)

let aster2 = new Asteroid({ pos: [70, 300] });
aster2.draw(contx)
});
