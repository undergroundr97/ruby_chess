require_relative './pawn'
require_relative './rook'
require_relative './knight'
require_relative './bishop'
require 'paint'
class Board
  attr_accessor :board

  def self.set_board
    b = self.new
    (0..7).each do |position|
      # b.display
        piece = Pawn.new(:white)
      b.place(piece, [position,1])
    end
    (0..7).each do |pos|
      piece = Pawn.new(:black)
      b.place(piece, [pos, 6])
    end
    [0,7].each do |pos|
      piece = Rook.new(:white)
      b.place(piece, [pos, 0])
    end
    [0,7].each do |pos|
      piece = Rook.new(:black)
      b.place(piece, [pos, 7])
    end
    [1,6].each do |pos|
      piece = Knight.new(:white)
      b.place(piece,[pos, 0])
    end
    [1,6].each do |pos|
      piece = Knight.new(:black)
      b.place(piece,[pos, 7])
    end
    [2,5].each do |pos|
      piece = Bishop.new(:white)
      b.place(piece,[pos,0])
    end
    [2,5].each do |pos|
      piece = Bishop.new(:black)
      b.place(piece,[pos,7])
    end

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
end

b = Board.set_board
b.display



puts Paint[b.board.each, Paint.random]