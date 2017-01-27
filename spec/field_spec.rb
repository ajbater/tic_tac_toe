require 'field'

describe Field do
  let(:player) { double :player }
  subject(:field) { described_class.new }

  it 'has a taken property, which is false by default' do
    expect(field.taken).to eq false
  end

  it 'knows which player it has been claimed by, this will be nil by default' do
    expect(field.taken_by).to eq nil
  end

  it 'the status of taken can be changed to true' do
    field.player_claims_field(player)
    expect(field.taken).to eq true
  end

  it 'the status of taken by can be assigned a value' do
    field.player_claims_field(player)
    expect(field.taken_by).to eq player
  end
end
