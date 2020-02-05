require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative( './models/country.rb' )
require_relative( './models/destination.rb' )
also_reload( './models/*' )

get '/home/' do
  redirect to '/home'
end

get '/home' do
  @planned_destinations = Destination.getMostRecentlyPlannedDests(3)
  @visited_destinations = Destination.getMostRecentlyVisitedDests(3)
  erb(:home)
end

get '/country/' do
  redirect to "/country"
end

get '/country' do
  @countries = Country.all()
  erb(:country_index)
end

get '/country/new' do
  @countries = Country.all()
  erb(:"new_country")
end

post '/country' do
  Country.new(params).save
  redirect to("/country")
end

get '/country/:id/edit' do
  @country = Country.find(params['id'])
  erb(:edit_country)
end

post '/country/:id' do
  country = Country.new(params)
  country.update
  redirect to "/country"
end

get '/country/:id/delete' do
  country = Country.find(params['id'])
  country.delete
  redirect to '/country'
end



##################################
get '/country/destination' do
  @countries = Country.all()
  @destinations = Destination.all()
  erb(:destination_index)
end

get '/country/destination/new' do
  @countries = Country.all
  @destinations = Destination.all
  erb(:"new_destination")
end

post '/country/destination/new' do
  destination = Destination.new(params)
  destination.save
  redirect to("/country/destination")
end

get '/country/destination/:id/edit' do
  @countries = Country.all()
  @destination = Destination.find(params['id'])
  @destination.type
  erb(:edit_destination)
end

post '/country/destination/:id' do
  destination = Destination.new(params)
  destination.update
  redirect to "/country/destination"
end

get '/country/destination/:id/delete' do
  destination = Destination.find(params['id'])
  destination.delete
  redirect to '/country/destination'
end

get '/country/destination/visited' do
  @countries = Country.all()
  @destinations_visited = Destination.dests_visited()
  erb(:visited_destinations)
end

get '/country/destination/planned' do
  @countries = Country.all()
  @destinations_planned = Destination.dests_planned()
  erb(:planned_destinations)
end
##################################

get '/country/destination/find' do
  erb(:destination_find)
end

get '/country/destination/find/name' do
  @destinations = Destination.all()
  @dest_find_results = Destination.find_by_dest_name(params['name'])
  erb(:destination_find_name)

end
