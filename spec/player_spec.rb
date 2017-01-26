require 'player'

describe Player do
  let(:board) { double :board }
  subject(:player) { described_class.new('Amanda', 'x') }

  it 'player has a name' do
    expect(player.name).to eq 'Amanda'
  end

  it 'player has a token' do
    expect(player.token).to eq :x
  end

  it { is_expected.to respond_to(:take_turn) }

  it 'can take their turn on the board by choosing a field' do
    player.take_turn(:A1)
    expect(board).to receive(:claim_field).with(:A1)
  end
end
