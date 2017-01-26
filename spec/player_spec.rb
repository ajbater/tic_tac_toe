require 'player'

describe Player do
  subject(:player) { described_class.new('Amanda', 'x') }

  it 'player has a name' do
    expect(player.name).to eq 'Amanda'
  end

  it 'player has a token' do
    expect(player.token).to eq :x
  end
end
