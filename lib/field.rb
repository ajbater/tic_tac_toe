# Is either claimed by a player or not
class Field

  attr_reader :taken, :taken_by

  def initialize
    @taken = false
    @taken_by = nil
  end

  def player_claims_field(player)
    taken?
    assign_player(player)
  end

  private

  attr_writer :taken, :taken_by

  def taken?
    self.taken = true
  end

  def assign_player(player)
    self.taken_by = player
  end

end
