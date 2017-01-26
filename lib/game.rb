class Game

  attr_reader :board
  attr_accessor :player1, :player2

  def initialize(board = board_klass.new)
    @board = board
    @player1 = nil
    @player2 = nil
  end

  def add_player(player)
    self.player1 ? self.player2 = player : self.player1 = player
  end

end
