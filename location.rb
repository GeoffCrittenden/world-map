class Location
  attr_reader :both, :coords, :opp_coords, :opp_status, :status

  def initialize(coords)
    @coords     = coords
    @opp_coords = opposite
    @status     = set_status(@coords)
    @opp_status = set_status(@opp_coords)
    @both       = both_land?
  end

  private

  def opposite
    return { lat: 0 - @coords[:lat], lon: @coords[:lon] - 180 } if @coords[:lon] > 0
    { lat: 0 - @coords[:lat], lon: 180 + @coords[:lon] }
  end

  def set_status(coords)
    info = JSON.parse(open("http://api.koordinates.com/api/vectorQuery.json/?key=#{ENV['API_KEY']}&layer=1294&x=#{coords[:lon]}&y=#{coords[:lat]}").string)
    return info["vectorQuery"]["layers"]["1294"]["features"][0]["properties"]["FeatureCla"] if info["vectorQuery"]["layers"]["1294"]["features"][0]
    "land"
  end

  def both_land?
    return true if @status == "land" && @opp_status == "land"
    "false"
  end

end