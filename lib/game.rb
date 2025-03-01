require_relative 'player'
require_relative 'board'

class Game
  attr_reader :player1, :player2
  attr_accessor :current_player
  def initialize
    @player1 = Player.new(:white)
    @player2 = Player.new(:black)
    @current_player = @player1
  end
  def switch
    # p self.current_player = (current_player == player1 ? player2 : player1)
    current = @current_player
     current == player1 ? player2 : player1
     p current.color
    p @current_player = current
  end
  def play
    puts "Go ahead #{@current_player}, it is your turn!"
  end
end

g = Game.new
g.play
g.switch
g.play
# g.switch
g.switch
g.play
