require 'oystercard'

describe OysterCard do
  it 'has initial balance of 0' do
    expect(OysterCard.new.balance).to eq 0
  end

  it 'can be topped up' do
    card = OysterCard.new
    card.top_up(10)
    expect(card.balance).to eq 10
  end
end
