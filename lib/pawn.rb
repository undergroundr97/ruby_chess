require_relative 'piece'
class Pawn < Piece
  def foward_dir
    color == :black ? -1 : 1
  end
  def start?
    color == :white && location.last == 1 ||
      color == :black && location.last == 6
  end
  def available_moves

    move = []
    col, row = location
    one_foward = [col, row + foward_dir]
    if !board.is_out?(one_foward)
      if board.empty?(one_foward) 
        move << one_foward
      end
    end
    two_foward = [col, row + (foward_dir * 2)]
    if board.empty?(two_foward) && board.empty?(one_foward) && start?
      move << two_foward
    end 
    diag_left = [col + 1, row + foward_dir] 
    diag_right = [col - 1, row + foward_dir] 
    if !board.is_out?(diag_left)
      if is_enemy?(diag_left)
        move << diag_left
      end
    end
    if !board.is_out?(diag_right)
      if is_enemy?(diag_right)
        move << diag_right
      end
    end
   move
  end
  def promote?
    if location.last == 0 || location.last == 7 
     puts "Your #{self} can promote! pick a piece"
     puts "Knight, Queen, Bishop, Rook"
     pick = gets.chomp.to_s
     new_piece = ""
     case pick
      when 'Knight'
         new_piece = Knight.new(self.board, self.color, self.location)
         self.board.place(new_piece, self.location)
     end
    end
  end
  def to_s
    color == :white ? "\u2659" : "\u265F"
  end
end

# puts piec = Pawn.new(:white)