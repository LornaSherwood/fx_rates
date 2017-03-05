require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/fx_controller')


get '/' do
  erb( :index )
end