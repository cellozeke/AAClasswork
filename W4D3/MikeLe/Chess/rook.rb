require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    def symbol
        :R
    end

    def move_dirs
        horizontal_and_vertical_dirs
    end

    def inspect
      'R'
    end
end
