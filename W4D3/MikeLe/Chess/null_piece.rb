require "singleton"
require_relative "piece"

class NullPiece < Piece
    include Singleton

    def initialize
        @name = ""
        @color = ""
        @pos = nil
    end

    def moves
        @pos # doesn't move :(
    end

    def symbol # how do you want to represent your piece, hexidecimal if we fancy
        # print out representation for each piece
        ' '.to_sym # <-- visual board representation for NullPiece # string#to_sym
    end

    def inspect
        '_'
    end
end
