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

  def claim_field(field, token)
    chosen_field
  end

end
