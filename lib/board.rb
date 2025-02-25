class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8){Array.new(8){}}
  end
  def place(piece, row, col)
    @board[row][col] = piece
  end
  def display
    (0..7).each do |row|
      (0..7).each do |col|
        print @board[row][col] == nil ? " -- " : @board[row][col]
        end
      puts
    end
  end
end

b = Board.new

b.place('king', 1,2)
# p b.board
p b.display