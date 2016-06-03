require 'rspec'
require_relative 'money'

describe Money do
  
  let(:fivedollar) { Money.dollar(5) }

  it "should be able to multiply an amount" do
    tendollars = fivedollar.times(2)
    expect(tendollars).to eq(Money.dollar(10)) #https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/equality-matchers
    fifteendollars = fivedollar.times(3)
    expect(fifteendollars).to eq(Money.dollar(15))
  end

  it "should be able to tell two amounts are equal" do
    expect(Money.dollar(5).==(Money.dollar(5))).to be true
    expect(Money.dollar(5).==(Money.dollar(6))).to be false
  end

  it "should be able to say which currency is involved" do
    expect(Money.dollar(1).currency).to eq "USD"
    expect(Money.franc(1).currency).to eq "CHF"
  end

  it "should be able to add two amounts of the same currency" do
    sum = Sum.new(Money.dollar(5), Money.dollar(5))
    normalized_sum = Bank.normalize(sum, "USD")
    expect(normalized_sum).to eq(Money.dollar(10))
  end

end