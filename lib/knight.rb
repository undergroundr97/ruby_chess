class Knight < Piece
  
  def move
  end
  def to_s
    color == :white ? "\u2658" : "\u265E"
  end
end
