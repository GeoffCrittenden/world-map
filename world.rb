require 'json'
require 'open-uri'
require 'dotenv'
Dotenv.load

require_relative 'location'

spot = Location.new({lat:4,lon:-4})
puts spot.status
spot = Location.new({lat:42,lon:-87})
puts spot.status