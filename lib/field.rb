class Field

  attr_accessor :taken, :token

  def initialize
    @taken = false
    @token = nil
  end

  def taken?
    self.taken = true
  end

  def assign_token(token)
    self.token = token
  end

end
