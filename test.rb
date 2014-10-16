ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'zipcode_lookup.rb'
 
include Rack::Test::Methods
 
def app
  Sinatra::Application
end

describe "Zipcode Lookup" do
	zip = Zipcode.get(10456)
  it "should return the city Bronx" do
    zip.city.downcase.must_equal 'bronx'
  end

  it "should return the state NY" do
    zip.state.upcase.must_equal 'NY'
  end

  it "should return the latitude 40.84" do
    zip.lat.must_equal 40.84
  end

  it "should return the longitude -73.87" do
    zip.lng.must_equal -73.87
  end

  it "should say 10456 is not decommissioned" do
    refute zip.decommissioned?
  end

  it "should return json" do
    get '/zipcode/10456'
    last_response.headers['Content-Type'].must_equal 'application/json'
  end
 
  it "should return the correct info about 15213 as json" do
    get '/zipcode/10456'
    obj = { city: zip.city, state: zip.state, lat: zip.lat, lng: zip.lng }
    obj.to_json.must_equal last_response.body
  end
 
end