#require library at some point

class Fx

  attr_reader( :currency_have, :currency_want )

  def initialize(options)
    @currency_have = options['currency_have']
    @currency_want = options['currency_want']
    @data = {"GBP" => 0.86355, "USD" => 1.0565}
  end

  def calculate_fx_multiplier()
    euro = 1 / @data["#{@currency_have}"]
    multiplier = euro * @data["#{@currency_want}"]
    return multiplier.round(2)
  end

end