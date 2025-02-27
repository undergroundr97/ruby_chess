module Stepable
  def available_moves
    move = []
    moves.each do |dx, dy|
      row, col = location
        row += dx
        col += dy
        loc = [row, col]
        next if board.is_out?(loc)
        if board.empty?(loc)
          move << loc
        end
        if is_enemy?(loc)
          move << loc
        end
     end
    move
  end
end