require 'board'

describe Board do
  let(:field) { double :field }
  subject(:board) { described_class.new(field) }

  before do
    allow(field).to receive(:new).and_return field
  end

  it 'creates a new grid with 9 fields upon instantiation' do
    expect(board.grid.count).to eq 9
  end
end
