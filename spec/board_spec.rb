require 'board'

describe Board do
  let(:player1) { double :player }
  let(:field) { double :field }
  let(:token) { double :token }
  subject(:board) { described_class.new(field) }

  before do
    allow(field).to receive(:new).and_return field
    allow(field).to receive(:taken).and_return false
  end

  it 'creates a new grid with 9 fields upon instantiation' do
    expect(board.grid.count).to eq 9
  end

  it 'should be able to find fields when given their coordinates' do
    expect(board.grid[:A1].taken).to eq false
  end

  it { is_expected.to respond_to(:claim_field).with(2).arguments }

  xit 'can change the taken status of the field to true' do
    allow(field).to receive(:player_claims_field).with(player1)
    board.claim_field(:A1, player1)
    expect(board.chosen_field_taken?(:A1)).to eq true
  end

  it 'will not allow the same field to be taken more than once' do
    allow(field).to receive(:player_claims_field).with(player1)
    expect(field).to receive(:player_claims_field).with(player1)
    board.claim_field(:A1, player1)
  end

  it 'knows when there are still fields remaining' do
    expect(board.all_fields_taken?).to eq false
  end
end
