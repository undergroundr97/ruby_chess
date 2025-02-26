# require_relative 'board'
class Pawn
  def initialize(color)
    @color = color
  end

  def to_s
    "\u2659"
  end
end

# puts piec = Pawn.new(:white)