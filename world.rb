class World

  def initialize
    @map  = []
    @lat  = 90
    @lon  = -180
    @step = 0.016667
  end

  def create_map
    10800.times do {
      row = []
      21600.times do { |n|
        @lon += (n * @step)
        row << Location.new({lat:@lat,lon:@lon})
      }
      @map << row
    }
    puts @map
  end

end