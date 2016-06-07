require 'minitest/autorun'
require_relative 'money'

class TestMoney < Minitest::Test

  def setup
    @fivedollars = Money.dollar(5)
    @fivefrancs = Money.franc(5)
  end

  def test_multiplication
    tendollars = @fivedollars.times(2)
    assert_equal Money.dollar(10), tendollars
    fifteendollars = @fivedollars.times(3)
    assert_equal Money.dollar(15), fifteendollars
    tenfrancs = @fivefrancs.times(2)
    assert_equal Money.franc(10), tenfrancs
  end

  def test_addition
    natwest = Bank.new
    sum = Sum.new(Money.dollar(5), Money.dollar(5))
    exchanged_sum = natwest.exchange(sum, "USD")
    assert_equal Money.dollar(10), exchanged_sum
  end

  def test_equality
    assert Money.dollar(5).==(Money.dollar(5))
    refute Money.dollar(5).==(Money.dollar(6))
    assert Money.franc(5).==(Money.franc(5))
    refute Money.franc(5).==(Money.franc(6))
    refute Money.franc(5).==(Money.dollar(5))
  end

  def test_currency
    assert "USD" == Money.dollar(1).currency
    assert "CHF" == Money.franc(1).currency
  end

  def test_exchanging_into_same_currency
    natwest = Bank.new
    result = natwest.exchange(Money.dollar(1), "USD")
    assert_equal Money.dollar(1), result
  end

  def test_exchanging_to_different_currency
    natwest = Bank.new
    natwest.set_rate("CHF","USD",0.5)
    result = natwest.exchange(Money.franc(2), "USD")
    assert_equal Money.dollar(1), result
  end

  def test_mixed_addition
    natwest = Bank.new
    natwest.set_rate("CHF","USD",0.5)
    sum = Sum.new(Money.dollar(5), Money.franc(10))
    exchanged_sum = natwest.exchange(sum, "USD")
    assert_equal Money.dollar(10), exchanged_sum
  end


end