class Game

  attr_reader :board
  attr_accessor :player1, :player2

  def initialize(board = board_klass.new)
    @board = board
    @player1 = nil
    @player2 = nil
  end

  def add_player(player)
    raise 'You already have two players - your game is ready to begin!' if two_players?
    self.player1 ? self.player2 = player : self.player1 = player
  end

  def two_players?
    !self.player1.nil? && !self.player2.nil?
  end

  def take_turn
    raise 'You cannot begin the game until you have two players!'
  end

end
