class Piece
  attr_reader :color, :board
  def initialize(board, color)
    @board = board
    @color = color
  end
end

