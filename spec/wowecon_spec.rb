require_relative "../lib/wowecon.rb"

describe Wowecon do
  realm = { :name => "Alonsus", :region => "EU", :faction => "alliance" }
  
  describe "With a valid item" do
    price = Wowecon.price("Rock Furrow Boots")
    it "should return either a price value for this item, or not found if no price data was found" do
      price.should have_key :gold
      # (
      #   price.should have_key(:gold) && 
      #   price.should have_key(:silver) && 
      #   price.should have_key(:copper) && 
      #   price.should have_key(:float) &&
      #   price[:gold].class.should == Fixnum
      #   price[:silver].class.should == Fixnum
      #   price[:copper].class.should == Fixnum
      #   price[:float].class.should == Float
      # ) || price.should == {:error => "price not found"}
    end
  end
  
  # use http://data.wowecon.com/?type=price&item_name=Rock%20Furrow%20Boots to confirm
  describe "With known market data" do
    it "should return a value of 7,401.0 for this item" do
      price = Wowecon.price("Rock Furrow Boots")
      price.should == {:gold=>7401, :silver=>0, :copper=>0, :float=>7401.0}
    end
  end

end