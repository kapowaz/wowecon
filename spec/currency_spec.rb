require_relative "../lib/wowecon/currency.rb"

describe Wowecon::Currency do
  
  before :each do
    @currency = Wowecon::Currency.new({:gold => 1420, :silver => 9, :copper => 10})
  end
  
  it "can be initialised using a floating point value" do
    currency = Wowecon::Currency.new(1420.091)
    currency.class.should == Wowecon::Currency
  end
  
  it "can be initialised using a hash" do
    currency = Wowecon::Currency.new({:gold => 1420, :silver => 9, :copper => 10})
    currency.class.should == Wowecon::Currency
  end
  
  it "responds to hash" do
    (@currency.should respond_to :to_hash) && @currency.to_hash.should == {:gold => 1420, :silver => 9, :copper => 10}
  end
  
  it "responds to float" do
    (@currency.should respond_to :to_f) && @currency.to_f.should == 1420.091
  end
  
  it "returns a currency value of zero if initialised with an invalid hash" do
    zero = Wowecon::Currency.new({:error => "price not found"})
    zero.to_s.should == "no price" && zero.to_f.should == 0 && zero.to_hash.should == {:gold => 0, :silver => 0, :copper => 0}
  end
  
  it "can create a string representation of the currency value" do
    @currency.to_s.should == "1,420g 9s 10c"
  end
  
  it "can create a HTML tag representation of the currency value" do
    @currency.to_html.should == '<var class="gold">1,420</var><var class="silver">9</var><var class="copper">10</var>'
  end
  
end