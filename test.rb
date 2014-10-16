ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'zipcode_lookup.rb'
 
include Rack::Test::Methods
 
def app
  Sinatra::Application
end

describe "Zipcode Lookup" do
	zip = Zipcode.get(15213)
  it "should return the city Pittsburgh" do
    zip.city.downcase.must_equal 'pittsburgh'
  end

  it "should return the state PA" do
    zip.state.upcase.must_equal 'PA'
  end

  it "should return the latitude 40.43" do
    zip.lat.must_equal 40.43
  end

  it "should return the longitude -79.97" do
    zip.lng.must_equal -79.97
  end

  it "should say 15213 is not decommissioned" do
    refute zip.decommissioned?
  end

  it "should return json" do
    get '/zipcode/15213'
    last_response.headers['Content-Type'].must_equal 'application/json'
  end
 
  it "should return the correct info about 15213 as json" do
    get '/zipcode/15213'
    obj = { zip: zip.zip, city: zip.city, state: zip.state, lat: zip.lat, lng: zip.lng }
    obj.to_json.must_equal last_response.body
  end
 
end