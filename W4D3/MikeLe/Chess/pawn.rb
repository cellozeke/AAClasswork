require_relative "piece"

class Pawn < Piece
    def symbol
        :P
    end

    def inspect
      'P'
    end

    def at_start_row?
        if color == :White
            return pos.first == 6
        else
            return pos.first == 1
        end
    end

    def forward_dir
        color == :White ? -1 : 1
    end

    def forward_steps
        row, col = pos
        
        valid_fwd_moves = []
        one_step = [row + forward_dir, col]
        p one_step
        valid_fwd_moves << one_step if board[one_step].empty? && board.valid_pos?(one_step)


        two_step = [row + (forward_dir * 2), col]
        p two_step
        valid_fwd_moves << two_step if board[two_step].empty? && at_start_row? && !valid_fwd_moves.empty?

        valid_fwd_moves
    end

    def side_attacks
        valid_side_moves = []
        attacks = color == :White ? [[-1, 1], [-1, -1]] : [[1, 1], [1, -1]]
        row, col = pos
        attacks.each do |attack|
          arow, acol = attack
          new_pos = [row + arow, col + acol]
          next unless board.valid_pos?(new_pos)
          valid_side_moves << new_pos if !board[new_pos].empty? && board[new_pos].color != color
        end
        valid_side_moves
    end

    def moves
      forward_steps + side_attacks
      # I see you Zeke haha
      # LOL our pawn is broken
    end
end