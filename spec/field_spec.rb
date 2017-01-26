require 'field'

describe Field do
  subject(:field) { described_class.new }

  it 'has a claimed property, which is false by default' do
    expect(field.claimed).to eq false
  end
end
