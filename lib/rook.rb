class Rook < Piece
  
  def move
  end
  def to_s
    color == :white ? "\u2656" : "\u265C"
  end
  
end
