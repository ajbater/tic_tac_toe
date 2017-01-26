class Game

  attr_reader :board
  attr_accessor :player1

  def initialize(board = board_klass.new)
    @board = board
    @player1 = nil
  end

end
