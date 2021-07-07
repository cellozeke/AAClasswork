const Asteroid = require("./asteroid.js");

function Game() {
  this.asteroids = [];
  this.addAsteroids();
};

Game.DIM_X = 800;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 25;

Game.prototype.addAsteroids = function() {
  console.log('hi');
  let ast1 = new Asteroid({pos: [1, 1]});
  console.log(ast1)
  // for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
  //   let x = Math.floor(Math.random() * Game.DIM_X)
  //   let y = Math.floor(Math.random() * Game.DIM_Y)
  //   this.asteroids.push(new Asteroid({pos: [x, y]}));
  // };
};

Game.prototype.test = function() {
  console.log(this);
};

module.exports = Game;
