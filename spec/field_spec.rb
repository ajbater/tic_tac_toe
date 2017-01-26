require 'field'

describe Field do
  subject(:field) { described_class.new }

  it 'has a taken property, which is false by default' do
    expect(field.taken).to eq false
  end

  it 'knows which token it has been claimed by, this will be nil by default' do
    expect(field.token).to eq nil
  end
end
