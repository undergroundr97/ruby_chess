require_relative 'stepable'
class King < Piece
  include Stepable
  def moves
    [
      [0,1],
      [0,-1],
      [1,0],
      [-1,0],
      [-1,-1],
      [-1,+1],
      [+1,-1],
      [+1,+1]
    ]

  end
  def to_s
    color == :white ? "\u2654" : "\u265A"
  end
end

