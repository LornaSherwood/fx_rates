class Fx

  attr_reader 
  attr_accessor 

  def initialize( options )
    @date = options['date']
    @currency_from = options['currency_from']
    @currency_to = options['currency_to']
  end

  # get from local storage

  data = { 
    GBP: 0.86355,
    USD: 1.0565
  }


  def calculate_fx_multiplier(data, currency_from, currency_to)
    euro = 1 / data[:GBP]
    multiplier = euro * data[:USD]
    return multiplier
  end

end