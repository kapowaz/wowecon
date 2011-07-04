module Wowecon
  module CurrencyHelpers

    def to_hash
      {:gold => @gold, :silver => @silver, :copper => @copper}
    end
  
    def to_f
      (@gold + (@silver.to_f / 100) + (@copper.to_f / 10000)).to_f
    end
  
    def to_s
      output = ""
      self.to_hash.each do |denom, value|
        if value > 0 || output.length > 0
          output += "#{value.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")}#{denom.to_s[0,1]} "
        end
      end
      
      if output == ""
        "no price"
      else
        output.strip
      end
    end

    def to_html
      tags  = ""
      self.to_hash.each do |denom, value|
        if value > 0 || tags.length > 0
          tags += "<var class=\"#{denom.to_s}\">#{value.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")}</var>"
        end
      end
      tags
    end
    
  end
end