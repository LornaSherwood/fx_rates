require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/fx')

#get home page (index)
get '/' do
  erb( :index )
end

# get selections
post '/' do
  date = params[:date]
  @rates = Fx.new(params)
  @results = @rates.return_rates(date) # create object of data
  
  # @results = (@fx.calculate_fx_multiplier(params[:date], params[:currency_have], params[:currency_want]) * params[:amount].to_f).round(2)
  erb(:index)
end
