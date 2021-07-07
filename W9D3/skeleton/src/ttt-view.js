class View {
  constructor(game, el) {
    this.board = el;
    this.setupBoard();
  };

  setupBoard() {
    for (let i = 0; i < 9; i++) {
      let li = document.createElement('li');
      this.board.appendChild(li);
    };
  };
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
