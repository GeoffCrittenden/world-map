class World

  def initialize
  end

  def opposite(coords)
    return { lat: 0 - coords[:lat], lon: coords[:lon] - 180 } if coords[:lon] > 0
    { lat: 0 - coords[:lat], lon: 180 + coords[:lon] }
  end

  def is_land?(coords)
    # API Magic goes here

  end

  def both_land?(coords)
    if is_land?(coords) && is_land?(opposite(coords))
      true
    else
      false
    end    
  end

end