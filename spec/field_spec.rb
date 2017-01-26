require 'field'

describe Field do
  subject(:field) { described_class.new }

  it 'has a taken property, which is false by default' do
    expect(field.taken).to eq false
  end

  it 'knows which token it has been claimed by, this will be nil by default' do
    expect(field.token).to eq nil
  end

  it 'the status of taken can be changed to true' do
    field.player_claims_field(:x)
    expect(field.taken).to eq true
  end

  it 'the status of token can be assigned a value' do
    field.player_claims_field(:x)
    expect(field.token).to eq :x
  end
end
