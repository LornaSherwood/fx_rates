#require library at some point

class Fx

  attr_reader( :currency_have, :amount, :currency_want )

  def initialize(options)
    @currency_have = options['currency_have']
    @currency_want = options['currency_want']
    @amount = options['amount']
    @data = {"GBP" => 0.86355, "USD" => 1.0565}
  end

  def calculate_fx_multiplier()
    #ExchangeRate.at(Date.today,'GBP','USD')
    euro = @amount.to_f / @data["#{@currency_have}"]
    counter_currency = euro * @data["#{@currency_want}"]

    return counter_currency.round(2)
  end

end