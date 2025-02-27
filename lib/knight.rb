require_relative 'stepable'
class Knight < Piece
  include Stepable
  def moves
    [
      [-2,1],
      [-2,-1],
      [2,-1],
      [2,1],
      [-1,-2],
      [-1,2],
      [1,-2],
      [1,2]
    ]
  end
  def to_s
    color == :white ? "\u2658" : "\u265E"
  end
end
