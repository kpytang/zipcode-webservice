class Zipcode
  include DataMapper::Resource

  property :zip,		Integer, :key => true  # zip codes are unique, so we'll use them as a key
  property :city,		String
  property :state,	String
  property :lat,    Float
  property :lng, 		Float
  property :decommissioned, 	Boolean

end