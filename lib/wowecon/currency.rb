module Wowecon
  class Currency
    
    attr_accessor :gold, :silver, :copper
    
    def initialize(value)
      if value.class == Float
        f           = sprintf("%.4f", value).split(".")
        self.gold   = f[0].to_i
        self.silver = f[1][0,2].to_i
        self.copper = f[1][2,2].to_i
      elsif value.class == Hash
        self.gold   = value[:gold]
        self.silver = value[:silver]
        self.copper = value[:copper]
      end
    end

    def self.from_hash(denoms)
      (denoms[:gold] + (denoms[:silver].to_f / 100) + (denoms[:copper].to_f / 10000)).to_f
    end
    
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
      output.strip
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