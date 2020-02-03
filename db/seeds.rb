require_relative( "../models/country.rb" )
require_relative( "../models/destination.rb")
require("pry-byebug")

Destination.delete_all()
Country.delete_all()


country1 = Country.new({
  "name" => "United States",
  "continent" => "North America",
  "visited" => true
});
country1.save;

country2 = Country.new({
  "name" => "Australia",
  "continent" => "Australasia",
  "visited" => true
  });
country2.save;

country3 = Country.new({
  "name" => "New Zealand",
  "continent"=> "Australasia",
  "visited"=> false
  });
country3.save;

country4 = Country.new({
  "name" => "Spain",
  "continent" => "Europe",
  "visited" => true
  });
country4.save;

country5 = Country.new({
  "name" => "Belgium",
  "continent"=> "Europe",
  "visited"=> false
  })
country5.save;


destination1 = Destination.new({
  "name" => "Sydney",
  "country_id"=> country2.id,
  "type" => "City",
  "visited" => true
  })
  destination1.save;

destination2 = Destination.new({
  "name" => "Puerto Pollensa",
  "country_id" => country4.id,
  "type" => "Beach",
  "visited" => false
  })
  destination2.save
