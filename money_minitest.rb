require 'minitest/autorun'
require_relative 'money'

class TestDollar < Minitest::Test

  def setup
    @fivedollars = Dollar.new(5)
  end

  def test_multiplication
    dollars = @fivedollars.times(2)
    assert_equal 10, dollars.amount
    dollars = @fivedollars.times(3)
    assert_equal 15, dollars.amount
  end

  def test_equality
    assert Dollar.new(5).equals(Dollar.new(5))
    refute Dollar.new(5).equals(Dollar.new(6))
  end

end