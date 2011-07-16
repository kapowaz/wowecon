require 'open-uri'
require 'nokogiri'
require 'wowecon/currency_helpers.rb'
require 'wowecon/currency.rb'

module Wowecon
  VERSION = '0.2.4'
  
  def self.price(item_name, opts={})
    request_url = "http://data.wowecon.com/?type=price&item_name=#{uri_escape(item_name)}"
    opts.each_pair {|name, value| request_url += "&#{name.to_s}=#{uri_escape(value)}" }
    response = Nokogiri::HTML(open(request_url))
    
    if response.css('table.wowecon_wowcurrency tr td').length > 0
      currency_types = {:g => :gold, :s => :silver, :c => :copper}
      currency_type  = nil
      currency       = {:gold => 0, :silver => 0, :copper => 0}
      
      cells = response.css('table.wowecon_wowcurrency tr td')
      cells.reverse_each do |cell|
        if img = cell.at_css('img')
          coin = img.attribute('alt').content.match(/([gsc])/)
          currency_type = currency_types[coin[0].to_sym]
          next
        end
        
        value = cell.inner_text.strip.match(/([0-9]+)/)
        if value
          currency[currency_type] = value[0].to_i
        end
      end

      {:value => "#{currency[:gold]}#{sprintf("%02d", currency[:silver])}#{sprintf("%02d", currency[:copper])}".to_i}
    else
      {:error => "price not found"}
    end
  end
  
  private
  
  def self.uri_escape(string)
    URI.escape(string, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
  end
end