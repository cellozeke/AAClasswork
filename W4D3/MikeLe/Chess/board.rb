require_relative 'piece'
require_relative 'null_piece'
require_relative "pawn"
require_relative "knight"
require_relative "bishop"
require_relative "rook"
require_relative "queen"
require_relative "king"

class Board
    DIM = 8

    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(DIM) { Array.new(DIM, @null_piece) }
    end

    def [](pos)
        raise "Invalid position. Coordinates be between 0,0 and #{DIM - 1},#{DIM - 1}" unless valid_pos?(pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        raise "Invalid position. Coordinates be between 0,0 and #{DIM - 1},#{DIM - 1}" unless valid_pos?(pos)
        row, col = pos
        @rows[row][col] = piece
    end

    def valid_pos?(pos)
        row, col = pos
        row.between?(0, DIM - 1) && col.between?(0, DIM - 1)
    end

    def add_piece(piece, pos)
        raise "Invalid position. Coordinates be between 0,0 and #{DIM - 1},#{DIM - 1}" unless valid_pos?(pos)
        self[pos] = piece
    end
end
