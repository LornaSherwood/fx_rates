require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/fx_controller')


# get page
get '/' do
  erb( :index )
end

