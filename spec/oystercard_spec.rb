require 'oystercard'

describe OysterCard do
  let(:station){ double :station }
  
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

#  it 'money is deducted from card' do
#    card = OysterCard.new
#    card.top_up(10)
#    card.deduct(2)
#    expect(card.balance).to eq 8
#  end

  context 'Card is initially not in use' do
    it { is_expected.to_not be_in_journey } 
  end    

  it 'is in journey after touching in' do
    card = OysterCard.new(10)
    card.touch_in(station)
    expect(card).to be_in_journey 
  end    

  it 'is no longer in journey after touching out' do
    card = OysterCard.new(10)
    card.touch_in(station)
    card.touch_out
    expect(card).to_not be_in_journey
  end    

  it 'cannot touch in if balance is below mimumum value' do
    card = OysterCard.new
    expect { card.touch_in(station) }.to raise_error "Balance is low, please top up"
  end

  it 'fair is deducted when touching out' do
    card = OysterCard.new(10)
    card.touch_in(station)
    expect { card.touch_out }.to change{card.balance}.by -2
  end

  it 'card knows its entry station' do
    card = OysterCard.new(10)
    card.touch_in(station)
    expect(card.entry_station).to eq station
  end

  it 'card forgets entry station on touch out' do
    card = OysterCard.new(10)
    card.touch_in(station)
    card.touch_out
    expect(card.entry_station).to eq nil
  end
end

