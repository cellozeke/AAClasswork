require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable

    def symbol
        :Q
    end

    def move_dirs
        horizontal_and_vertical_dirs + diagonal_dirs
    end

    def inspect
      'Q'
    end
end