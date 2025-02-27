require_relative 'piece'
class Pawn < Piece
 
  def moves
    [[0,1]]
  end
  def to_s
    color == :white ? "\u2659" : "\u265F"
  end
end

# puts piec = Pawn.new(:white)