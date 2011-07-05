require_relative 'currency_helpers.rb'

module Wowecon
  class Currency
    include Wowecon::CurrencyHelpers
    
    def initialize(value)
      if value.class == Fixnum
        @value = value
      elsif value.class == Float
        @value = sprintf("%.4f", value).split(".").join("").to_i
      elsif value.class == Hash
        if value.key?(:gold) and value.key?(:silver) and value.key?(:copper)
          @value = "#{value[:gold]}#{sprintf("%02d", value[:silver])}#{sprintf("%02d", value[:copper])}".to_i
        else
          @value = 0
        end
      end
    end

  end
end