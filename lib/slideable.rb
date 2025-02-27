module Slideable
  def available_moves
    move = []
    rook_moves.each do |dx, dy|
      row, col = location
      loop do 
        row += dx
        col += dy
        loc = [row, col]
        break if board.is_out?(loc)
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