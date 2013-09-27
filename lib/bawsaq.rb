require 'faraday'

module BAWSAQ
  base_path = File.expand_path(File.dirname(__FILE__))
  require File.join base_path, 'bawsaq/version'
  require File.join base_path, 'bawsaq/stock'
  require File.join base_path, 'bawsaq/stock_collection'

  URL = 'http://socialclub.rockstargames.com/games/gtav/ajax/stockdetail'

  # TODO: find out how to switch platforms
  def self.fetch(platform=:ps3)
    StockCollection.parse(Faraday.get(URL).body)
  end

end
