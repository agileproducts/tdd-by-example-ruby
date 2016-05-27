require 'minitest/autorun'
require_relative 'money'

class TestDollar < Minitest::Test

  def setup
    @fivedollars = Dollar.new(5)
  end

  def test_multiplication
    @fivedollars.times(2)
    assert_equal 10, @fivedollars.amount
    @fivedollars.times(3)
    assert_equal 15 @fivedollars.amount
  end

end