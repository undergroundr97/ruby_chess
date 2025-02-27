class Bishop < Piece
  def move
  end
  def to_s
    color == :white ? "\u2657" : "\u265D"
  end
end
