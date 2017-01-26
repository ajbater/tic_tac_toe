require 'field'

describe Field do
  subject(:field) { described_class.new }

  it 'has a claimed property, which is false by default' do
    expect(field.claimed).to eq false
  end

  it 'knows which token it has been claimed by, this will be nil by default' do
    expect(field.token).to eq nil
  end
end
