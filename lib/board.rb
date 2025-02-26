require_relative './pawn'
require 'paint'
class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8){Array.new(8){}}
  end
  def place(piece, location)
    col, row = location
    @board[col][row] = piece
  end
  def display
   puts "\n A  B  C  D  E  F  G  H "
    (0..7).each do |row|
      puts '------------------------'
      (0..7).each do |col|
        print board[col][row] == nil ? "   " : " #{@board[col][row]} "        
      end
      puts row
    end
    puts '------------------------'
  end
  def is_out?(location)
    row, col = location
     row >= 0 && row <= 7 && col >= 0 && col <= 7 ? false : true
  end
end

b = Board.new
piec = Pawn.new(:white)
# b.display
(0..7).each do |position|
  # b.display
    piece = Pawn.new(:white)
  b.place(piece, [position,1])
end
(0..7).each do |pos|
  piece = Pawn.new(:black)
  b.place(piece, [pos, 6])
end

# b.place('king', [1,2])
# b.place('king', [1,-2])
# p b.board
b.display


p b.is_out?([1,2])
p b.is_out?([0,2])
p b.is_out?([-1,2])

puts Paint['Ruby', Paint.random]