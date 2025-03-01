class Player
  attr_reader :color
  def initialize(color)
    @color = color
  end
  def to_s
    color == :white ? "White" : "Black"
  end
end