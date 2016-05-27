require 'rspec'
require_relative 'money'

describe Dollar do
  
  let(:fivedollar) { Dollar.new(5) }

  it "should be able to multiply an amount" do
    dollars = fivedollar.times(2)
    expect(dollars.amount).to eql(10)
    dollars = fivedollar.times(3)
    expect(dollars.amount).to eql(15)
  end

  it "should be able to tell two amounts are equal" do
    expect(Dollar.new(5).equals(Dollar.new(5))).to be true
    expect(Dollar.new(5).equals(Dollar.new(6))).to be false
  end

end