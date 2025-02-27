class King < Piece
  def move
  end
  def to_s
    color == :white ? "\u2654" : "\u265A"
  end
end

