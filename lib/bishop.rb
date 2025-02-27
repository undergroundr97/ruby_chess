
class Bishop < Piece
  include Slideable
  def moves
    [
      [+1,+1],
      [+1,-1],
      [-1,-1],
      [-1,+1]
    ]
  end
  def to_s
    color == :white ? "\u2657" : "\u265D"
  end
end
