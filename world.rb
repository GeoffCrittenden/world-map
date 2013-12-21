class World

  def initialize
  end

  def opposite(coords)
    return { lat: 0 - coords[:lat], lon: coords[:lon] - 180 } if coords[:lon] > 0
    { lat: 0 - coords[:lat], lon: 180 + coords[:lon] }
  end

end