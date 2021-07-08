const Game = require('../ttt_node/game');

class View {
  constructor(game, el) {
    this.game = game;
    this.board = el;
    this.handleClick = this.handleClick.bind(this);
    this.board.addEventListener('click', this.handleClick);
    this.setupBoard();
  };

  setupBoard() {
    for (let i = 0; i < 9; i++) {
      let li = document.createElement('li');
      let pos = `[${Math.floor(i / 3)}, ${i % 3}]`;
      li.setAttribute("data-pos", pos);
      li.setAttribute("data-mark", 'empty');
      this.board.appendChild(li);
    };
  };
  
  bindEvents() {

  };

  handleClick(e) {
    let pos = e.target.getAttribute('data-pos');
    console.log(this);
    console.log(this.game);
    try {
      this.makeMove(pos); 
    } catch(MoveError) {
      alert("Bad move!");
    }
  };

  makeMove(square) {
    const li = document.querySelector("li[data-pos="+`'${square}'`+"]"); // MAY NEED TO FIX
    const current = this.game.currentPlayer;
    
    this.game.playMove(JSON.parse(square));
    li.setAttribute('data-mark', current);
    
    let gameOver = this.game.isOver();
    if(gameOver) {
      let fig = document.querySelector(".ttt");
      let label = null;
      let img = null;
      if(this.game.winner() === 'x') {
        label = document.createElement("label");
        label.innerHTML = "Congrats RUBY!!!";
        img = document.createElement("img");
        img.setAttribute("src", "../dist/ruby.png");
        fig.appendChild(img);
      } else if(this.game.winner() === 'o') {
        label = document.createElement("label");
        label.innerHTML = "BOOOOOOOOO JAVASCRIPT!!!";
        img = document.createElement("img");
        img.setAttribute("src", "../dist/js.png");
        fig.appendChild(img);
      } else {
        label = document.createElement("label");
        label.innerHTML = "Tie: nobody wins";
      }
      fig.appendChild(label);
    }
  }
}

module.exports = View;
