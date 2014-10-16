zipcode-webservice
==================
A simple web service that allows you to get the city, state, and lat/lng coordinates for a given zip code.

Uses Sinatra/Ruby, PostgreSQL, and DataMapper. TDD is done with MiniTest.

Demo: http://zipcode-lookup.herokuapp.com/zipcode/10456

You can replace the '10456' with another zipcode. Note that due to hosting constraints, the database this based on is not a complete set, so not all zipcodes will work.
