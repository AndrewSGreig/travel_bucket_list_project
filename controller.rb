require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( './models/country.rb' )
require_relative( './models/destination.rb' )
also_reload( './models/*' )

get '/country' do
  @countries = Country.all()
  erb(:index)
end

################################
#####Need to work on this
get '/country/new' do
  @countries = Country.all()
  erb(:"new_country")
end

post '/country' do
  Country.new(params).save
  redirect to("/country")
end
###################################

##################################
# get '/country/destination' do
#   binding.pry
#   @destinations = Destination.all()
#   erb(:destination_index)
# end
#
# get '/country/destination/new' do
#   binding.pry
#   @countries = Country.all
#   @destinations = Destination.all
#   erb(:"new_destination")
# end
#
# post '/country/destination/new' do
#   destination = Destination.new(params)
#   destination.save
#   redirect to("/country/destination")
# end
##################################
