class Money
  attr_reader :amount, :currency

  def initialize(amount,currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    return self.class.new(@amount * multiplier, @currency)
  end

  def ==(object)
    return @amount == object.amount && @currency == object.currency
  end

  def self.dollar(amount)
    return self.new(amount,"USD")
  end

  def self.franc(amount)
    return self.new(amount,"CHF")
  end

end

