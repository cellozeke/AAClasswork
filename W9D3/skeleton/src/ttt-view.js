class View {
  constructor(game, el) {
    this.board = el;
    this.setupBoard();
  };

  setupBoard() {
    for (let i = 0; i < 9; i++) {
      let li = document.createElement('li');
      let pos = `[${Math.floor(i / 3)}, ${i % 3}]`;
      li.setAttribute("data-pos", pos);
      this.board.appendChild(li);
    };
  };
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
