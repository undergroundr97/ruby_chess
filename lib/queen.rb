class Queen < Piece
  include Slideable
  def moves
    [[0,1],
      [0,-1],
      [1,0],
      [-1,0],
      [-1,-1],
      [-1,+1],
      [+1,-1],
      [+1,+1]]
  end
  def to_s
    color == :white ? "\u2655" : "\u265B"
  end
end
