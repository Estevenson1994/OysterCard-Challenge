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

  it 'raises error if balance is above 90' do
    card = OysterCard.new
    card.top_up(90)
    expect { card.top_up(1) }.to raise_error 'Balance cannot go above 90'
  end

  it 'money is deducted from card' do
    card = OysterCard.new
    card.top_up(10)
    card.deduct(2)
    expect(card.balance).to eq 8
  end
end
