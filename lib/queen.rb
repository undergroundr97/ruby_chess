class Queen < Piece
  
  def move
  end
  def to_s
    color == :white ? "\u2655" : "\u265B"
  end
end
