const Board = require('./board.js')

class Game {
    constructor() {
        this.board = new Board();
        this.player1 = "X";
        this.player2 = "O";
        this.currentPlayer = this.player1;
    }
}

Game.prototype.run = function (reader, completionCallback) {
    console.log("hello");
    this.board.printBoard();
    reader.question("input a position", (input) => {    
        this.run(reader, completionCallback);
    });
}


const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

g = new Game();
g.run(reader);

module.exports = Game;