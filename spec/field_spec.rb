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
    field.taken?
    expect(field.taken).to eq true
  end

  it 'the status of token can be assigned a value' do
    field.assign_token('token')
    expect(field.token).to eq 'token'
  end
end
