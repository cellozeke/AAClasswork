const View = require('./ttt-view')
const Game = require('../ttt_node/game')

document.addEventListener("DOMContentLoaded", () => {
  const game = new Game();
  const board = document.querySelector('#board');
  const view = new View(game, board);
});
