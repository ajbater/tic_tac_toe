class Player

  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token.to_sym
  end

  def take_turn
    
  end

end
