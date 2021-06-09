module Stepable
    def move_diffs
      raise NotImplementedError
    end

    def moves
      valid_moves = []
      diff_moves = move_diffs
      row, col = pos
      diff_moves.each do |move|
        dx, dy = move
        new_pos = [dx + row, dy + col]
        next unless board.valid_pos?(new_pos) # || board[new_pos].color != color
        next if board[new_pos].color == color
        valid_moves << new_pos
      end
      valid_moves
    end
end
