require_relative "../lib/wowecon/currency.rb"

describe Wowecon::Currency do

  it "can be initialised using a floating point value" do
    currency = Wowecon::Currency.new(1420.091)
    currency.class.should == Wowecon::Currency
  end
  
  it "can be initialised using a hash" do
    currency = Wowecon::Currency.new({:gold => 1420, :silver => 9, :copper => 10})
    currency.class.should == Wowecon::Currency
  end
  
  it "can be initialised using an integer" do
    currency = Wowecon::Currency.new(1420091)
    currency.class.should == Wowecon::Currency
  end
  
  it "returns nil if initialised with an invalid hash" do
    @zero = Wowecon::Currency.new({:error => "price not found"})
    @zero.should be_nil
  end
  
  it "returns nil if initialised with nil" do
    @nilcurrency = Wowecon::Currency.new(nil)
    @nilcurrency.should be_nil
  end
  
  it "returns a currency with a value of zero if initialised with 0" do
    zero = Wowecon::Currency.new(0)
    zero.class.should == Wowecon::Currency and zero.to_s.should == "0c"
  end
  
  describe "for a given valid currency" do
    before do
      @currency = Wowecon::Currency.new({:gold => 1420, :silver => 9, :copper => 10})      
    end
    
    it "responds with the integer representation by default" do
      @currency.should == 14200910
    end
    
    it "responds to integer" do
      (@currency.should respond_to :to_i) and @currency.to_i.should == 14200910
    end

    it "responds to hash" do
      (@currency.should respond_to :to_hash) and @currency.to_hash.should == {:gold => 1420, :silver => 9, :copper => 10}
    end

    it "responds to float" do
      (@currency.should respond_to :to_f) and @currency.to_f.should == 1420.091
    end
    
    it "responds to greater than" do
      (@currency.should respond_to :>) and @currency.should > 14200000
    end
    
    it "responds to less than" do
      (@currency.should respond_to :<) and @currency.should < 20000000
    end
    
    it "responds to greater than/equal to" do
      (@currency.should respond_to :>=) and @currency.should >= 14200000
    end
    
    it "responds to less than/equal to" do
      (@currency.should respond_to :<=) and @currency.should <= 20000000
    end

    it "can create a string representation of the currency value" do
      @currency.to_s.should == "1,420g 9s 10c"
    end

    it "can create a HTML tag representation of the currency value" do
      @currency.to_html.should == '<var class="gold">1,420</var><var class="silver">9</var><var class="copper">10</var>'
    end
  end

end