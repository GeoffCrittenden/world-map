class World

  def initialize(map_data)
    @map_data = map_data
  end

  def opposite(coords)
    opp_coords = {}
    opp_coords[:lat] = 0 - coords[:lat]
    if coords[:lon] > 0
      opp_coords[:lon] = coords[:lon] - 180
    else
      opp_coords[:lon] = 180 + coords[:lon]
    end
    opp_coords
  end

end