require_relative "../lib/wowecon.rb"

describe Wowecon do
  realm = { :name => "Alonsus", :region => "EU", :faction => "alliance" }
  
  describe "With a valid item" do
    price = Wowecon.price("Rock Furrow Boots")
    
    unless price.has_key? :error
      describe "if price data was found" do
        it "should have an integer gold value" do
          (price.should have_key :gold) && price[:gold].class.should == Fixnum
        end
        
        it "should have an integer silver value" do
          (price.should have_key :silver) && price[:silver].class.should == Fixnum
        end
        
        it "should have an integer copper value" do
          (price.should have_key :copper) && price[:copper].class.should == Fixnum
        end
        
        it "should have float value representing the complete price" do
          (price.should have_key :float) && price[:float].class.should == Float
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
    it "should return a value of 7401.0 for this item" do
      price = Wowecon.price("Rock Furrow Boots")
      price.should == {:gold=>7401, :silver=>0, :copper=>0, :float=>7401.0}
    end
  end

end