module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [
      [1, 0],
      [0, 1],
      [-1, 0],
      [0, -1]
    ]

    DIAGONAL_DIRS = [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]

    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def move_dirs
    end

    def moves
        valid_moves = []
        dir_moves = move_dirs

        dir_moves.each do |dir|
            dx, dy = dir
            count = 1
            stop = false

            until stop
                check = grow_unblocked_moves_in_dir(count * dx, count * dy)
                valid_moves << check.first
                count += 1
                stop = true unless check[1]
            end
        end
        valid_moves.compact
    end

    def grow_unblocked_moves_in_dir(dx, dy)
      row, col = pos
      new_pos = [dx + row, dy + col]
      return [nil, false] unless board.valid_pos?(new_pos)
      if @board[new_pos].empty?
        return [new_pos, true]
      else
        if @board[new_pos].color == color
            return [nil, false]
        else
            return [new_pos, false]
        end
      end
    end

end
