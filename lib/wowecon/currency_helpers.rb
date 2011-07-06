module Wowecon
  module CurrencyHelpers

    @value = 0

    def to_i
      @value
    end

    def to_hash
      copper = @value.to_s[-2..-1].to_i
      silver = @value.to_s[-4..-3].to_i
      gold   = @value.to_s[0..-5].to_i      
      {:gold => gold, :silver => silver, :copper => copper}
    end
  
    def to_f
      @value.to_f / 10000
    end
  
    def to_s
      output = ""
      self.to_hash.each do |denom, value|
        if value > 0 || output.length > 0
          output += "#{value.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")}#{denom.to_s[0,1]} "
        end
      end
      
      if output == ""
        "0"
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
    
    def ==(other) 
      @value == other.to_i
    end
    
    def nil?
      @value.nil?
    end
    
  end
end