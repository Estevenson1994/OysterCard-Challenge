class OysterCard

  MINIMUM_BALANCE = 1
  attr_reader :balance, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @entry_station
  end

  def top_up(money)
    fail 'Balance cannot go above 90' if above_maximum?(money)
    @balance += money
  end


  def touch_in(station)
    fail "Balance is low, please top up" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(2)
    @entry_station = nil
  end
  
  def in_journey?
    @entry_station.nil? == false
  end

  private

  def above_maximum?(money)
    @balance + money > 90
  end

  def deduct(fare)
    @balance -= fare
  end
end
