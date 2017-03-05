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
  @results = @fx.display_params()
  erb(:index)
end
