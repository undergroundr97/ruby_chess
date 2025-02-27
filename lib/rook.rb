require_relative 'slideable'
class Rook < Piece
  include Slideable
  def moves
    [
      [0,1],
      [0,-1],
      [1,0],
      [-1,0]
    ]
  end
  
  def to_s
    color == :white ? "\u2656" : "\u265C"
  end
  
end
