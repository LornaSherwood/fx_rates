require 'crack/xml'
require 'net/http'
#require 'nokogiri'

result = Net::HTTP.get(URI.parse('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml'))

parsed = Crack::XML.parse result


puts parsed["gesmes:Envelope"]["Cube"]["Cube"][0]["Cube"][0]["currency"]
puts parsed["gesmes:Envelope"]["Cube"]["Cube"][0]["Cube"][0]["rate"]



# @data['#{["Cube"]["Cube"]["Cube"][0]["currency"]'}] = '#{["Cube"]["Cube"]["Cube"][0]["rate"]}'
