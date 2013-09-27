module BAWSAQ
  class Stock

    ATTRIBUTES = {
      'Id' => :id,
      'Name' => :name,
      'Summary' => :summary,
      'CompanyCode' => :company_code,
      'CompanyName' => :company_name,
      'Index' => :index,
      'CurrentPrice' => :current_price,
      'HighPrice' => :high_price,
      'LowPrice' => :low_price,
      'PriceMovement' => :price_movement,
      'PriceMovementPercent' => :price_movement_percent,
      'PriceMovementDirection' => :price_movement_direction,
      'TotalPrice' => :total_price,
      'TotalPriceMovement' => :total_price_movement,
      'TotalPriceMovementPercent' => :total_price_movement_percent,
      'TotalPriceMovementDirection' => :total_price_movement_direction,
      'Modifiers' => :modifiers,
      'PriceHistory' => :price_history,
      'IsLoggedIn' => :is_logged_in,
    }

    attr_reader *ATTRIBUTES.values

    def initialize(stock_hash)
      ATTRIBUTES.each do |key, attr|
        send("#{attr}=", stock_hash[key])
      end
    end

    private

    attr_writer *ATTRIBUTES.values

    [:current_price, :low_price, :high_price, :price_movement].each do |attr|
      define_method("#{attr}=") do |value|
        instance_variable_set("@#{attr}", value.gsub('$', '').to_f)
      end
    end

    def price_history=(value)
      @price_history = value.to_s.split(',').map(&:to_f)
    end

  end
end
