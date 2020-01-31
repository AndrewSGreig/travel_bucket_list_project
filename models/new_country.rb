require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/country.rb' )
also_reload( '../models/*' )

get '/country' do
  @countries = Country.all
  erb ( :"bitings/index" )
end

post '/country/:id/delete' do
  Country.delete(params[:id])
  redirect to("/bitings")
end
