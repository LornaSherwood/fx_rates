require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/fx')

#get home page (index)
get '/' do
  erb( :index )
end

# get selections
post '/' do
  @fx = Fx.new(params)
  @results = (@fx.calculate_fx_multiplier() * params[:amount].to_f).round(2)
  erb(:index)
end
