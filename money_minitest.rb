require 'minitest/autorun'
require_relative 'money'

class TestDollar < Minitest::Test

  def setup
    @fivedollars = Dollar.new(5)
  end

  def test_multiplication
    tendollars = @fivedollars.times(2)
    assert_equal Dollar.new(10), tendollars
    fifteendollars = @fivedollars.times(3)
    assert_equal Dollar.new(15), fifteendollars
  end

  def test_equality
    assert Dollar.new(5).==(Dollar.new(5))
    refute Dollar.new(5).==(Dollar.new(6))
  end

end

class TestFranc < Minitest::Test

  def setup
    @fivefrancs = Franc.new(5)
  end

  def test_multiplication
    tenfrancs = @fivefrancs.times(2)
    assert_equal Franc.new(10), tenfrancs
  end

  def test_equality
    assert Franc.new(5).==(Franc.new(5))
    refute Franc.new(5).==(Franc.new(6))
  end

end

class TestMoney < Minitest::Test

  def test_equality
    assert Dollar.new(5).==(Dollar.new(5))
    refute Dollar.new(5).==(Dollar.new(6))
    assert Franc.new(5).==(Franc.new(5))
    refute Franc.new(5).==(Franc.new(6))
    refute Franc.new(5).==(Dollar.new(5))
  end

end