class Field

  attr_reader :claimed, :token

  def initialize
    @claimed = false
    @token = nil
  end

end
