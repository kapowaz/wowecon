require_relative 'currency_helpers.rb'

module Wowecon
  class Currency
    include Wowecon::CurrencyHelpers
    
    def initialize(value)
      @value = case
      when value.kind_of?(Fixnum)
        value
      when value.kind_of?(Float)
        sprintf("%.4f", value).split(".").join("").to_i
      when value.kind_of?(Hash)
        if value.key?(:gold) and value.key?(:silver) and value.key?(:copper)
          "#{value[:gold]}#{sprintf("%02d", value[:silver])}#{sprintf("%02d", value[:copper])}".to_i
        else
          nil
        end
      else
        nil
      end
    end

  end
end