require 'rspec'
require_relative 'money'

describe Dollar do
  
  let(:fivedollar) { Dollar.new(5) }

  it "should be able to multiply an amount" do
    tendollars = fivedollar.times(2)
    expect(tendollars).to eq(Dollar.new(10)) #https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/equality-matchers
    fifteendollars = fivedollar.times(3)
    expect(fifteendollars).to eq(Dollar.new(15))
  end

  it "should be able to tell two amounts are equal" do
    expect(Dollar.new(5).==(Dollar.new(5))).to be true
    expect(Dollar.new(5).==(Dollar.new(6))).to be false
  end

end