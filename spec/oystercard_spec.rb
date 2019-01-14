require 'oystercard'

describe OysterCard do
  it 'has initial balance of 0' do
    expect(OysterCard.new.balance).to eq 0
  end
end
