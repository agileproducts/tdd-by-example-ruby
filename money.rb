class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    return self.class.new(@amount * multiplier)
  end

  def equals(object)
    return @amount == object.amount
  end

end