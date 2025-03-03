require_relative 'player'
require_relative 'board'
require 'json'
class Game
  attr_accessor :current_player, :board, :player1, :player2
  def initialize
    @player1 = Player.new(:black)
    @player2 = Player.new(:white)
    @current_player = @player2
    @board = Board.set_board
  end
  def switch
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
  def start_game
    puts "Welcome to CHESS!"
    # @board = Board.set_board # had to set this to instance variable so json can acess it 
    a_to_h = ('a'..'h').to_a
    hash_a_h = Hash.new(0)
    a_to_h.each_with_index do |let, index|
      hash_a_h[let] = index
    end
    p hash_a_h
    board.display
    loop do 
    # puts "Welcome to CHESS!"
    puts "It's #{@current_player.color}'s turn!"
    puts "Select a piece with two coordinates as: a1 or h6"
    pick = gets.chomp.to_s
    if pick == 'save'
      puts "Saving current game"
      save_game
      puts "Saved"
    end
    if pick == 'load'
      puts 'Loading..'
      load_game
      puts 'Loaded'
    end
    working_piece_a = pick.split('').first
    working_piece_a = hash_a_h[working_piece_a]
    working_piece_b = pick.split('').last.to_i
    working_piece = [working_piece_a, working_piece_b]
    # p working_piece.map {|x| x = hash_a_h[x]} 
    working_piece = [working_piece_a, working_piece_b]
    while board.get_piece(working_piece) == nil
    board.display
    puts "Invalid position!"
    puts "Select again as: a1 or h6"
    pick = gets.chomp.to_s
    working_piece_a = pick.split('').first
    working_piece_a = hash_a_h[working_piece_a]
    working_piece_b = pick.split('').last.to_i
    working_piece = [working_piece_a, working_piece_b]
    # piece = board.get_piece(working_piece)
    end
    while working_piece.length <= 1 || board.get_piece(working_piece).available_moves.empty? do 
      board.display
      puts "The piece #{board.get_piece(working_piece)} has no available moves at this time!"
      puts "Pick another piece!"
      # board.display
      pick = gets.chomp.to_s
      # board.display
    working_piece_a = pick.split('').first
    working_piece_a = hash_a_h[working_piece_a]
    working_piece_b = pick.split('').last.to_i
    working_piece = [working_piece_a, working_piece_b]
    # piece = board.get_piece(working_piece)
    end
    piece = board.get_piece(working_piece)
    
    while board.get_piece(working_piece) == nil || piece.color != @current_player.color do 
      board.display
      puts "Invalid move!"
      puts "Select another piece!"
      pick = gets.chomp.to_s
      # if board.get_piece(pick) == nil 
      #   puts "You can't pick an empty place!"
      #   pick = gets.chomp.to_s
      # end
      working_piece_a = pick.split('').first
      working_piece_a = hash_a_h[working_piece_a]
      working_piece_b = pick.split('').last.to_i
      working_piece = [working_piece_a, working_piece_b]
      piece = board.get_piece(working_piece)
    end
    check_moves = piece.available_moves
    check_moves.map! do |arr|
        arr[0] = hash_a_h.key(arr[0])
        "#{arr[0]}#{arr[1]}"
    end
    puts "You selected #{piece}, the available moves are: #{check_moves.join(', ')}"
    puts "Where you want to move? as: a2"
    move_to = gets.chomp.to_s 
    working_move = move_to.split('')
     working_move_a = working_move.first
     working_move_a = hash_a_h[working_move_a]
     working_move_b = working_move.last.to_i
     working_move = [working_move_a, working_move_b]
      to_check_moves = piece.available_moves
    while !to_check_moves.include?(working_move) do
      puts "This move is not valid! available moves are #{check_moves.join(', ')}"
      move_to = gets.chomp.to_s 
      working_move = move_to.split('')
      working_move_a = working_move.first
      working_move_a = hash_a_h[working_move_a]
      working_move_b = working_move.last.to_i
      working_move = [working_move_a, working_move_b]
    end
    board.move_piece(piece.location, working_move)
    if piece.class == Pawn && piece.promote?
      board.display
      piece.promote?
    end
    board.display
    switch
    end
  end
  def to_json
    JSON.dump ({
      :board => @board,
      :player1 => Player.new(:black),
      :player2 => Player.new(:white),
      :current_player => current_player
    })
  end
  def save_game
    Dir.mkdir('SavedGame') unless Dir.exist?('SavedGame')
    filename = "SavedGame/save.json"
    File.open(filename, 'w') do |file|
      file.puts to_json
    end
  end
  def load_game
    game_data = JSON.parse(File.read('SavedGame/save.json'), symbolize_names: true)
    p game_data
    g = Game.new
    g.board = game_data[:board]
    g.player1 = Player.new(game_data[:player1])
    g.player2 = Player.new(game_data[:player2])
    p current  = current_player = game_data[:current_player].to_sym
    g.current_player = Player.new(current)
    g.start_game
  end
end


# g.play
# g.switch
# g.start_game
# # g.switch
# g.switch
# g.play?
# 
