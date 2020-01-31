require_relative( "../models/country.rb" )
require_relative( "../models/destination.rb")
require("pry-byebug")

Destination.delete_all()
Country.delete_all()


country1 = Country.new({
  "name" => "United States",
  "continent" => "North America",
  "visited" => "visited"
});
country1.save;

country2 = Country.new({
  "name" => "Australia",
  "continent" => "Australasia",
  "visited" => "visited"
  });
country2.save;

country3 = Country.new({
  "name" => "New Zealand",
  "continent"=> "Australasia",
  "visited"=> "not visited"
  });
country3.save;

country4 = Country.new({
  "name" => "Spain",
  "continent" => "Europe",
  "visited" => "visited"
  });
country4.save;

country5 = Country.new({
  "name" => "Belgium",
  "continent"=> "Europe",
  "visited"=> "not visited"
  })
country5.save;
 binding.pry;

destination1 = Destination.new({
  "name" => "Sydney",
  "country_id"=> country2.id,
  "type" => "City",
  "visited" => "visited"
  })
  destination1.save;

destination2 = Destination.new({
  "name" => "Puerto Pollensa",
  "country_id" => country4.id,
  "type" => "Beach",
  "visited" => "not visited"
  })
  destination2.save
