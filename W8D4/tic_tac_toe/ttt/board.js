class Board {
    constructor() {
        this.grid = new Array(3).fill("_").map(() => Array(3).fill("_"));
    }

    empty(pos) {
        return this.grid[pos[0]][pos[1]] === "_";
    }

    valid(pos) {
        return (pos[0] <= 2) && (pos[0] >= 0) && (pos[1] <= 2) && (pos[1] >= 0);
    }

    placeMark(pos, mark) {
        if (!this.valid(pos)) {
            throw new Error("position not on board");
        } else if (!this.empty(pos)) {
            throw new Error("there's a piece there");
        } else {
            this.grid[pos[0]][pos[1]] = mark;
        }
    }

    printBoard() {
        for (let i = 0; i < 3; i++) {
            console.log(this.grid[i].join(" "));
        }
    }

    wonRow() {
        for (let i = 0; i < 3; i++) {
            if (this.grid[i][0] === this.grid[i][1] && this.grid[i][1] === this.grid[i][2]) {
                return true;
            }
        }
        return false;
    }

    wonCol() {
        for (let i = 0; i < 3; i++) {
            if (this.grid[0][i] === this.grid[1][i] && this.grid[1][i] === this.grid[2][i]) {
                return true;
            }
        }
        return false;
    }

    wonDiag() {
        if (this.grid[0][0] === this.grid[1][1] && this.grid[1][1] === this.grid[2][2]) {
            return true;
        }
        if (this.grid[2][0] === this.grid[1][1] && this.grid[1][1] === this.grid[0][2]) {
            return true;
        }
        return false;
    }

    won() {
        if (this.wonRow() || this.wonCol() || this.wonDiag()) {
            return true;
        }
        return false;
    }

    emptyPositions() {
        // this.grid.forEach(row => { row.forEach(ele => {
        //     if (ele === "_") return true;
        // })});
        for (let i = 0; i < 3; i++) {
            for (let j = 0; j < 3; j++) {
                if (this.grid[i][j] === "_") return true;
            }
        }
        return false;
    }
}

module.exports = Board;