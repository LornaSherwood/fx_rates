require 'crack/xml'
require 'net/http'
require_relative('./day_rates')

class DataUpdater

  attr_reader(:url)

  def initialize()
    @url = url
  end

  def get_data
    result = Net::HTTP.get(URI.parse('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'))
    parsed = Crack::XML.parse result
    return parsed
  end

  def transform_data(data)
    rates = Hash.new
    array = data["gesmes:Envelope"]["Cube"]["Cube"][0]["Cube"]

    for item in array
      currency = item["currency"]
      rate = item["rate"]
      rates[currency] = rate
    end

    return rates
    
  end

  def create_rates_object(rates_hash)
    
    date = Date.today
    rates = DayRates.new(date, rates_hash["USD"], rates_hash["JPY"], rates_hash["BGN"], rates_hash["CZK"], rates_hash["DKK"], rates_hash["GBP"], rates_hash["HUF"], rates_hash["PLN"])
    return rates
  end

end

############# How to save to database ####################################

test_run = DataUpdater.new # create object for 'today'
data = test_run.get_data()  # parse results from url

rates_hash = test_run.transform_data(data) # change data to format for db


day_rates = test_run.create_rates_object(rates_hash) # create object of data

day_rates.save() # save data to database



