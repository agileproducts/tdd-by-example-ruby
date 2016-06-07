class Money
  attr_reader :amount, :currency

  def initialize(amount,currency)
    @amount = amount.to_f
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

  def change(bank,to_currency)
    rate = bank.rate(@currency,to_currency)
    return self.class.new(@amount*rate,to_currency)
  end

end

class Bank
  def initialize
    @exchange_rates_table = {}
  end

  def exchange(expression,to_currency)
    expression.change(self,to_currency)
  end

  def rate(from,to)
    lookup_rate(from,to)
  end

  def set_rate(from,to,rate)
    @exchange_rates_table.merge!({from => {to => rate}})
  end  

  def lookup_rate(from,to)
     if from == to then return 1.0 end
     @exchange_rates_table[from][to]
  end


end


class Sum

  def initialize(augend,addend)
    @augend = augend
    @addend = addend
  end

  def change(bank,to_currency)
    amount = @augend.amount + @addend.amount
    return Money.new(amount,to_currency)
  end

end

