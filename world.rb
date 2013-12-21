require 'json'
require 'open-uri'

class Location
  attr_reader :coords, :opp_coords, :info

  def initialize(coords)
    @coords     = coords
    @opp_coords = opposite
  end

  def both_land?
    return true if is_land(@coords) && is_land?(@opp_coords)
    false   
  end

  private

  def opposite
    return { lat: 0 - @coords[:lat], lon: @coords[:lon] - 180 } if @coords[:lon] > 0
    { lat: 0 - @coords[:lat], lon: 180 + @coords[:lon] }
  end

  def is_land?(coords)
    # API Magic goes here
    info = open("http://api.koordinates.com/api/vectorQuery.json/?key=#{'API_KEY'}&layer=1294&x=#{coords[:lat]}&y=#{coords[:lon]}")
    @info = JSON.parse(info)
    puts @info
  end

end