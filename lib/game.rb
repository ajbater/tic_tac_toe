class Game

  attr_reader :board
  attr_accessor :player1, :player2, :turn

  def initialize(board = board_klass.new)
    @board = board
    @player1 = nil
    @player2 = nil
  end

  def add_player(player)
    raise 'You already have two players - your game is ready to begin!' if two_players?
    self.player1 ? self.player2 = player : self.player1 = player
  end

  def take_turn(field)
    raise 'You cannot begin the game until you have two players!' if !two_players?
    player = current_player
    raise 'This field has already been taken!' if self.board.chosen_field_taken?(field)
    self.board.claim_field(field, player) unless winner? || game_over?
    return winner if winner?
    return game_over if game_over?
    switch_player
  end

  def winner?
    self.board.winner?
  end

  def winner
    return "#{current_player.name} is the winner!"
  end

  def game_over
    return 'Game Over - no winner!'
  end

  def two_players?
    !self.player1.nil? && !self.player2.nil?
  end

  def turn
    @turn ||= player1
  end

  def switch_player
    turn == player1 ? self.turn = player2 : self.turn = player1
  end

  def current_player
    self.turn
  end

  def game_over?
    all_fields_taken? && !winner?
  end

  def all_fields_taken?
    self.board.all_fields_taken?
  end

  def game_over_no_winner?
    all_fields_taken?
  end

end
