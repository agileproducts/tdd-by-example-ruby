require 'rspec'
require_relative 'money'

describe Dollar do
  
  let(:fivedollar) { Dollar.new(5) }

  it "should be able to multiply an amount" do
    fivedollar.times(2)
    expect(fivedollar.amount).to eql(10)
  end

end