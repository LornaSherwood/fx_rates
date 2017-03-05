require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative('../models/fx')


#get home page (index)
get '/fx' do
  @fx = Fx.calculate_fx_multiplier
  erb(:"fx/index")
end