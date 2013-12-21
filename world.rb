class World

  def initialize
  end

  def opposite(coords)
    if coords[:lon] > 0
      return { lat: 0 - coords[:lat], lon: coords[:lon] - 180 }
    else
      { lat: 0 - coords[:lat], lon: 180 + coords[:lon] }
    end
  end

end