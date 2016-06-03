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
    sum = Money.dollar(5) + Money.dollar(5)
    assert_equal Money.dollar(10), sum
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



end