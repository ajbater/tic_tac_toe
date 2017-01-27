require 'player'

describe Player do
  subject(:player) { described_class.new('Amanda') }

  it 'player has a name' do
    expect(player.name).to eq 'Amanda'
  end
end
