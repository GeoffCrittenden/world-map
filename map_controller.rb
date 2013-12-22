require 'json'
require 'open-uri'

require 'dotenv'
Dotenv.load

require_relative 'location'

spot = Location.new({lat:42,lon:-87})
puts spot.status
puts spot.opp_status
puts spot.both