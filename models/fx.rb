#require library at some point
require 'pstore'

class Fx

  attr_reader( :currency_have, :currency_want )

  def initialize(options)
    @currency_have = options['currency_have']
    @currency_want = options['currency_want']
    @data = PStore.new("fx.pstore")
  end

  def update_rates_data
    @data.transaction do
     @data["GBP"] = 0.86355
     @data["USD"] = 1.0565
     @data["JPY"] = 120.83

     @data.commit
    end
  end

  def return_rates_data
    @data.transaction do
      return @data["GBP"]
    end
  end

  def calculate_fx_multiplier()
    #ExchangeRate.at(Date.today,'GBP','USD')
    @data.transaction do
      euro = 1.0 / @data["#{@currency_have}"]
      counter_currency = euro * @data["#{@currency_want}"]
      return counter_currency
    end
  end

  

end

