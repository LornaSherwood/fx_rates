require 'pstore'

data = PStore.new("fx.pstore")

data.transaction do
 data["GBP"] = 0.86355
 data["USD"] = 1.0565
 data["JPY"] = 120.83

 data.commit
end

data.transaction do
  puts data["GBP"]
end

data.transaction do
  puts data["JPY"]
end