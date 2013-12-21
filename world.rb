class Location
  attr_reader :coords, :opp_coords

  def initialize(coords)
    @coords     = coords
    @opp_coords = opposite
  end

  def is_land?
    # API Magic goes here

  end

  def both_land?
    return true if is_land?(@coords) && is_land?(@opp_coords)
    false   
  end

  private

  def opposite
    return { lat: 0 - @coords[:lat], lon: @coords[:lon] - 180 } if @coords[:lon] > 0
    { lat: 0 - @coords[:lat], lon: 180 + @coords[:lon] }
  end

end