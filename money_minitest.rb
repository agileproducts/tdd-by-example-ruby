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

end