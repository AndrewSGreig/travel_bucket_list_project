require_relative( "../models/country.rb" )
require("pry-byebug")

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
  "visited"=> "visited"
  });
  country3.save;
