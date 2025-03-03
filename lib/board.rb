require_relative './pawn'
require_relative './rook'
require_relative './knight'
require_relative './bishop'
require_relative './king'
require_relative './queen'
require_relative 'slideable'
require_relative 'stepable'
require_relative 'player'
require_relative 'game'
require 'paint'
class Board 
  attr_accessor :board

  def self.set_board
    b = self.new
    (0..7).each do |position|
      # b.display
        piece = Pawn.new(b, :white, [position,1])
      b.place(piece, [position,1])
    end
    (0..7).each do |pos|
      piece = Pawn.new(b, :black, [pos, 6])
      b.place(piece, [pos, 6])
    end
    [0,7].each do |pos|
      piece = Rook.new(b, :white, [pos, 0])
      b.place(piece, [pos, 0])
    end
    [0,7].each do |pos|
      piece = Rook.new(b, :black, [pos, 7])
      b.place(piece, [pos, 7])
    end
    [1,6].each do |pos|
      piece = Knight.new(b, :white, [pos, 0])
      b.place(piece,[pos, 0])
    end
    [1,6].each do |pos|
      piece = Knight.new(b, :black, [pos, 7])
      b.place(piece,[pos, 7])
    end
    [2,5].each do |pos|
      piece = Bishop.new(b, :white, [pos,0])
      b.place(piece,[pos,0])
    end
    [2,5].each do |pos|
      piece = Bishop.new(b, :black, [pos,7])
      b.place(piece,[pos,7])
    end
    kingw = King.new(b, :white, [4,0])
    kingb = King.new(b, :black, [4,7])
    queenw = Queen.new(b, :white, [3,0])
    queenb = Queen.new(b, :black, [3,7])
    b.place(kingw, [4,0])
    b.place(kingb, [4,7])
    b.place(queenw, [3,0])
    b.place(queenb, [3,7])
    # pawntest = Pawn.new(b, :white,[1,6])
    # b.place(pawntest, [1,6])
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
    col, row = location
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
  def delete_piece_at(position)
    col, row = position
    board[col][row] = nil
  end
  def move_piece(start_pos, end_pos)
    col, row = start_pos
    puts piece = self.get_piece(start_pos)
      if piece.available_moves.include?(end_pos)
        # self[col][row] = nil
        self.place(piece, end_pos)
        # p self[start_pos] = nil
        self.delete_piece_at(start_pos)
        piece.location = end_pos
      end
  end
  def to_json
     @board
  end
  def self.from_json(data)
    b = self.new
    data.each_with_index do |array, col|
      array.each_with_index do |piece, row|
        p row
        p col
        next if piece == nil
        if piece == "♖"
          b.place(Rook.new(b, :white, [col,row]), [col,row])
        end
        if piece == "♜"
          b.place(Rook.new(b, :black, [col,row]), [col,row])
        end
        if piece == "♙"
          b.place(Pawn.new(b, :white, [col,row]), [col,row])
        end
        if piece == "♟"
          b.place(Pawn.new(b, :black, [col,row]), [col,row])
        end
        if piece == "♗"
          b.place(Bishop.new(b, :white, [col,row]), [col,row])
        end
        if piece == "♝"
          b.place(Bishop.new(b, :black, [col,row]), [col,row])
        end
        if piece == "♘"
          b.place(Knight.new(b, :white, [col,row]), [col,row])
        end
        if piece == "♞"
          b.place(Knight.new(b, :black, [col,row]), [col,row])
        end
        if piece == "♚"
          b.place(King.new(b, :black, [col,row]), [col,row])
        end
        if piece == "♔"
          b.place(King.new(b, :white, [col,row]), [col,row])
        end
        if piece == "♛"
          b.place(Queen.new(b, :black, [col,row]), [col,row])
        end
        if piece == "♕"
          b.place(Queen.new(b, :white, [col,row]), [col,row])
        end
      end
    end
    b
  end
end

b = Board.new

# b.display
# b.display
# b.place(Rook.new(b, :white, [3,3]), [3,3])
# b.display
# b.place(King.new(b, :white, [1,1]), [1,1])
# b.place(Knight.new(b, :white, [2,2]), [2,2])
# b.place(Bishop.new(b, :white, [4,4]), [4,4])
# b.display
# p b.get_piece([3,3]).available_moves
# p b.get_piece([1,1]).available_moves
# p b.get_piece([2,2]).available_moves
# p b.get_piece([4,4]).available_moves
# 
#  b.place(Knight.new(b, :white, [1,2]), [1,2])
#  b.place(Pawn.new(b, :white, [7,7]), [7,7])
# p b.get_piece([7,7]).available_moves
# b.move_piece([0,1],[0,3])
# p b.get_piece([1,6]).available_moves
# p b.get_piece([0,0]).available_moves
# b.move_piece([0,0], [0,2])
# b.move_piece([0,2], [2,2])
# b.move_piece([2,2], [2,6])
# b.move_piece([1,6],[1,4])
# b.move_piece([0,3],[1,4])
# p b.get_piece([1,4]).available_moves
# b.display
# p b.get_piece([1,4]).available_moves
# p b.get_piece([0,3]).available_moves
# 
# p b.get_piece([2,6]).available_moves
