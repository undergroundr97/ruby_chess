class Piece
  attr_reader :color, :board, :location
  def initialize(board, color, location)
    @board = board
    @color = color
    @location = location
  end
  def is_enemy?(location)
    !board[location].nil? && board[location].color != color
  end
end

