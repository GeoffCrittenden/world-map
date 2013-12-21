class Location
  attr_reader :coords, :opp_coords, :status

  def initialize(coords)
    @coords     = coords
    @opp_coords = opposite
    @status     = set_status(@coords)
  end

  def is_land?(coords)
    
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

  def set_status(coords) 
    info = JSON.parse(open("http://api.koordinates.com/api/vectorQuery.json/?key=#{ENV['API_KEY']}&layer=1294&x=#{coords[:lat]}&y=#{coords[:lon]}").string)
    return info["vectorQuery"]["layers"]["1294"]["features"][0]["properties"]["FeatureCla"] if info["vectorQuery"]["layers"]["1294"]["features"][0]
    "land"
  end

end