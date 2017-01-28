require 'board'

describe Board do
  let(:player1) { double :player }
  let(:field) { double :field, :taken => false }
  let(:second_field) { double :field, :taken => true }
  let(:token) { double :token }
  subject(:board) { described_class.new(field) }

  before do
    allow(field).to receive(:new).and_return field
    allow(field).to receive(:taken).and_return false
    allow(second_field).to receive(:taken).and_return true
    allow(field).to receive(:player_claims_field).with(player1)
  end

  it 'creates a new grid with 9 fields upon instantiation' do
    expect(board.grid.count).to eq 9
  end

  it 'should be able to find fields when given their coordinates' do
    allow(field).to receive(:taken).and_return true
    expect(board.grid[:A1].taken).to eq true
  end

  it { is_expected.to respond_to(:claim_field).with(2).arguments }

  xit 'can change the taken status of the field to true' do
    expect(board.chosen_field_taken?(second_field)).to eq true
  end

  it 'will not allow the same field to be taken more than once' do
    expect(field).to receive(:player_claims_field).with(player1)
    board.claim_field(:A1, player1)
  end

  it 'knows when there are still fields remaining' do
    expect(board.all_fields_taken?).to eq false
  end

  xit 'knows when all fields have been taken' do
    expect(board.all_fields_taken?).to eq true
  end
end
