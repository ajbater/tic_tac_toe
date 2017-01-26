class Field

  attr_reader :taken, :token

  def initialize
    @taken = false
    @token = nil
  end

  def player_claims_field(token)
    taken?
    assign_token(token)
  end

  private

  attr_writer :taken, :token

  def taken?
    self.taken = true
  end

  def assign_token(token)
    self.token = token
  end

end
