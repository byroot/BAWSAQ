require 'multi_json'

module BAWSAQ
  class StockCollection
    include Enumerable

    def self.parse(json_payload)
      dataset = MultiJson.load(json_payload)
      new(dataset['Stocks'].map(&Stock.method(:new)))
    end

    def initialize(stocks)
      @stocks = stocks
    end

    def [](index_or_code)
      case index_or_code
      when Integer
        @stocks[index_or_code]
      else
        code = index_or_code.to_s
        @stocks.find{ |s| s.company_code == code }
      end
    end

    def each(&block)
      @stocks.each(&block)
    end

  end
end