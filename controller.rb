require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/country.rb' )
also_reload( './models/*' )

get '/country' do
  @countries = Country.all()
  erb(:index)
end

get '/country/new' do
  @countries = Countries.all
  erb(:"new_country")
end
