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
    @amount == object.amount && @currency == object.currency
  end

  def self.dollar(amount)
    return self.new(amount,"USD")
  end

  def self.franc(amount)
    return self.new(amount,"CHF")
  end

  def change(to_currency)
    return self
  end

end

class Bank
  def initialize
  end

  def exchange(expression,to_currency)
    expression.change(to_currency)
  end
end


class Sum

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def change(to_currency)
    amount = @augend.amount + @addend.amount
    return Money.new(amount,to_currency)
  end

end

