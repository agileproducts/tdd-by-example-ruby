class Money
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    return self.class.new(@amount * multiplier)
  end

  def ==(object)
    return @amount == object.amount && self.class == object.class
  end

end

class Dollar < Money

end

class Franc < Money

end