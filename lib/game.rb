require_relative 'player'
require_relative '../lib/board'

class Game
  attr_reader :player1, :player2
  attr_accessor :current_player
  attr_accessor :board
  def initialize
    @player1 = Player.new(:white)
    @player2 = Player.new(:black)
    @current_player = @player1
  
  end
  def switch
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
  def start_game
    puts "Welcome to CHESS!"
    board = Board.set_board
    loop do 
    # puts "Welcome to CHESS!"
    puts "It's #{@current_player.color}'s turn!"
    puts "Select a piece with two coordinates as: 0,0"
    pick = gets.chomp.to_s
    working_piece = pick.split(',').map {|x| x.to_i}
    piece = board.get_piece(working_piece)
    puts "You selected #{piece}, the available moves are #{piece.available_moves}"
    puts "Where you want to move? as: 0,0"
    move_p = gets.chomp.to_s
    working_move = move_p.split(',').map {|x| x.to_i}
    board.move_piece(piece.location, working_move)
    board.display
    if piece.class == Pawn
      piece.promote?
    end
    switch
    end
  end
  def play
    puts "play"
  end
end

g = Game.new
# g.play
# g.switch
# g.start_game
# # g.switch
# g.switch
# g.play?
# 
