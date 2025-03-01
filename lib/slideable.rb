module Slideable
  def available_moves
    move = []
    moves.each do |dx, dy|
      row, col = location
      loop do 
        row += dx
        col += dy
        loc = [row, col]
        break if board.is_out?(loc)
        if board.get_piece(loc) != nil && board.get_piece(loc).color == self.color
          break
        end
        if board.get_piece(loc) != nil && board.get_piece(loc).color != self.color
          move << loc
          break
        end
        if board.empty?(loc)
          move << loc
        end
        if is_enemy?(loc)
          move << loc
          break
        end
      end
    end
    move
  end
end