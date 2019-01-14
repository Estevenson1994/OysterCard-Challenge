class OysterCard

attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(money)
    fail 'Balance cannot go above 90' if above_maximum?(money)
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end

  private

  def above_maximum?(money)
    @balance + money > 90
  end
end
