class Piece
    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos

        board.add_piece(self, pos)
    end

    def pos=(val)
        @pos = val
    end

    def empty?
        symbol == ' '.to_sym
    end

    # def to_s
        # symbol already outputs string
    # end

    def symbol
    end

    def valid_moves
    end

    private
    def move_into_check?(end_pos)

    end
end
