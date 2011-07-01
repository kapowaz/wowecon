require_relative 'currency_helpers.rb'

module Wowecon
  class Currency
    include Wowecon::CurrencyHelpers
    
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

  end
end