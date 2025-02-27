require_relative './pawn'
require_relative './rook'
require_relative './knight'
require_relative './bishop'
require_relative './king'
require_relative './queen'
require_relative 'slideable'
require_relative 'stepable'
require 'paint'
class Board 
  attr_accessor :board

  def self.set_board
    b = self.new
    (0..7).each do |position|
      # b.display
        piece = Pawn.new(b, :white)
      b.place(piece, [position,1])
    end
    (0..7).each do |pos|
      piece = Pawn.new(b, :black)
      b.place(piece, [pos, 6])
    end
    [0,7].each do |pos|
      piece = Rook.new(b, :white)
      b.place(piece, [pos, 0])
    end
    [0,7].each do |pos|
      piece = Rook.new(b, :black)
      b.place(piece, [pos, 7])
    end
    [1,6].each do |pos|
      piece = Knight.new(b, :white)
      b.place(piece,[pos, 0])
    end
    [1,6].each do |pos|
      piece = Knight.new(b, :black)
      b.place(piece,[pos, 7])
    end
    [2,5].each do |pos|
      piece = Bishop.new(b, :white)
      b.place(piece,[pos,0])
    end
    [2,5].each do |pos|
      piece = Bishop.new(b, :black)
      b.place(piece,[pos,7])
    end
    kingw = King.new(b, :white)
    kingb = King.new(b, :black)
    queenw = Queen.new(b, :white)
    queenb = Queen.new(b, :black)
    b.place(kingw, [4,0])
    b.place(kingb, [4,7])
    b.place(queenw, [3,0])
    b.place(queenb, [3,7])
    b
  end

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
  def empty?(location)
    row, col = location
    board[row][col].nil?
  end
  def get_piece(location)
    row, col = location
    board[row][col]
  end
  def [](location)
    row, col = location
    board[row][col] = get_piece(location)
  end
end

b = Board.new
# b.display
b.place(Rook.new(b, :white, [3,3]), [3,3])
b.display
b.place(King.new(b, :white, [1,1]), [1,1])
b.place(Knight.new(b, :white, [2,2]), [2,2])
b.place(Bishop.new(b, :white, [4,4]), [4,4])
b.display
p b.get_piece([3,3]).available_moves
p b.get_piece([1,1]).available_moves
p b.get_piece([2,2]).available_moves
p b.get_piece([4,4]).available_moves


