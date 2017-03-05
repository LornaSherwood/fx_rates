#require library at some point

class Fx

  attr_reader( :currency_have, :currency_want )

  def initialize(options)
    @currency_have = options['currency_have']
    @currency_want = options['currency_want']
  end

  def display_params()
    return "#{@currency_have} + #{@currency_want}"
  end


  # def calculate_fx_multiplier(currency_have, currency_want)
  #   euro = currency_have / @data[:GBP]
  #   multiplier = euro * @data[:USD]
  #   return multiplier
  # end

end