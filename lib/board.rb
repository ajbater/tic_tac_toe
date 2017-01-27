class Board

  attr_reader :grid

  def initialize(field_klass)
    @grid = {}
    [*'A'..'C'].each do |letter|
      [*1..3].each do |number|
        @grid["#{letter}#{number}".to_sym] = field_klass.new
      end
    end
  end

  def claim_field(field, player)
    chosen_field = self.grid[field]
    chosen_field.player_claims_field(player)
  end

  def chosen_field_taken?(field)
    chosen_field = self.grid[field]
    chosen_field.taken
  end

  def all_fields_taken?
    fields = self.grid.values
    taken_fields = fields.select { |field| field.taken }
    taken_fields.length == 9
  end

end
