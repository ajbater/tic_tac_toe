class Board

  attr_reader :grid
  attr_accessor :winning_combinations

  def initialize(field_klass)
    @grid = {}
    [*'A'..'C'].each do |letter|
      [*1..3].each do |number|
        @grid["#{letter}#{number}".to_sym] = field_klass.new
      end
    end
    @winning_combinations = []
  end

  def winner?
    create_winning_combinations
    check_if_winning_combination_taken
    check_if_same_player_claimed_fields
    self.winning_combinations.length == 1
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

  private


  def create_winning_combinations
    self.winning_combinations = [self.grid.values_at(:A1, :A2, :A3), self.grid.values_at(:B1, :B2, :B3), self.grid.values_at(:C1, :C2, :C3), self.grid.values_at(:A1, :B1, :C1), self.grid.values_at(:A2, :B2, :C2), self.grid.values_at(:A3, :B3, :C3), self.grid.values_at(:A1, :B2, :C3), self.grid.values_at(:A3, :A2, :C1)]
  end

  def check_if_winning_combination_taken
    self.winning_combinations.each do |combination|
      combination.keep_if { (combination[0].taken && combination[1].taken) && combination[2].taken }
    end
  end

  def check_if_same_player_claimed_fields
    self.winning_combinations.each do |combination|
      combination.keep_if { combination[0].taken_by == combination[1].taken_by && combination[0].taken_by == combination[2].taken_by }
    end
    winning_combinations.keep_if { |combination| combination.length == 3 }
  end

end
