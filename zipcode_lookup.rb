require 'sinatra'
require 'data_mapper'
require	'./models/zipcode.rb'
require 'json'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/geocode')
DataMapper.finalize.auto_upgrade!

get '/zipcode/:id' do
	content_type :json
  zip = Zipcode.get(params[:id])
  { city: zip.city, state: zip.state, lat: zip.lat, lng: zip.lng }.to_json
end