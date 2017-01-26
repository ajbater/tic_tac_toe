class Field

  attr_reader :taken, :token

  def initialize
    @taken = false
    @token = nil
  end

  def taken?
    @taken = true
  end

end
