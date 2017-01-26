require 'board'

describe Board do
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

  it 'can change the taken status of the field to true' do
    board.claim_field(field, token)
    expect(field).to receive(:player_claims_field).with(token)
  end
end
