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
    // let pos = JSON.parse(e.target.getAttribute('data-pos'));
    console.log(this);
    console.log(this.game);
    this.makeMove(pos);
  };

  makeMove(square) {
    const li = document.querySelector("li[data-pos="+`'${square}'`+"]"); // MAY NEED TO FIX
    console.log(li);
    li.setAttribute('data-mark', this.game.currentPlayer);
    this.game.playMove(JSON.parse(square));
  }
}

module.exports = View;
