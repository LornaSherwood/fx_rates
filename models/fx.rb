require_relative("../db/sql_runner")

class Fx

  attr_reader( :date, :currency_have, :currency_want )

  def initialize(options)
    @date = options['date']
    @currency_have = options['currency_have']
    @currency_want = options['currency_want']
  end

  def return_rates(date)
    sql = "SELECT * FROM fx_rates WHERE date = '#{ date }';"
    #sql2 = "SELECT '#{currency_want}' FROM fx_rates WHERE date = '#{ date }';"
    have = SqlRunner.run(sql).first
    #want = SqlRunner.run(sql2)
    return have
  end

  def calculate_fx_multiplier(date, currency_have, currency_want)
    #ExchangeRate.at(Date.today,'GBP','USD')
    results = self.return_rates(date)
    
    euro_rate = 1.0 / results['#{currency_have}']
    counter_currency = euro_rate * results['#{currency_want}']
    return counter_currency
  end

end



