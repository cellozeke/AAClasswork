const MovingObject = require("./moving_object");
const Util = require("./utils.js")


function Asteroid(pos) {
    const COLOR = 'orange';
    const RADIUS = '25'
    MovingObject.call(this, pos)
    this.color = COLOR;
    this.radius = RADIUS
    const vel = Util.randomVec(10)
    //hard coded 10 as length
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;