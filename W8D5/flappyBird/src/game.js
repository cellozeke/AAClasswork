import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }

  animate(){
    //first we move and draw the level
    this.level.animate(this.ctx);
    //then we move and draw the bird
    this.bird.animate(this.ctx);
    //then we check to see if the game is over and let the player know
    if (this.gameOver()) {
      alert(this.score);
      this.restart();
    }

    //we see if they have scored a point by passing a pipe
    this.level.passedPipe(this.bird.bounds(), () => {
      this.score += 1;
      console.log(this.score);
    });

    //and draw the score
    this.drawScore();

    //if the game is NOT running, we do not animate the next frame
    if (this.running) {
      //This calls this function again, after around 1/60th of a second
      requestAnimationFrame(this.animate.bind(this));
    }
  }

  restart(){
    this.level = new Level(this.dimensions)
    this.animate.apply(this.level)();
  }
}