function Superclass(name) {
  this.name = name;
};

function Subclass() {};

function Surrogate() {};
Surrogate.prototype = Superclass.prototype;
Subclass.prototype = new Surrogate();
Subclass.prototype.constructor = Subclass;


Function.prototype.inherits = function(parent) {
  
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);
