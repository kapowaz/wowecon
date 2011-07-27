require_relative "../lib/wowecon.rb"

describe Wowecon do
  realm = { :name => "Alonsus", :region => "EU", :faction => "alliance" }
  
  describe "With a valid item" do
    price = Wowecon.price("Rock Furrow Boots")
    
    unless price.has_key? :error
      describe "if price data was found" do
        it "should have an integer value" do
          (price.should have_key :value) && price[:value].class.should == Fixnum
        end
      end
    else
      describe "if no price data was found" do
        it "should return an error" do
          price.should == {:error => "price not found"}
        end
      end
    end
    
  end
  
  # use http://data.wowecon.com/?type=price&item_name=Rock%20Furrow%20Boots to confirm
  describe "With known market data" do
    it "should return a value of 25000000 for this item" do
      price = Wowecon.price("Rock Furrow Boots")
      price.should == {:value => 25000000}
    end
  end

end