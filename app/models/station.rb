class Station
  attr_reader :name
  def initialize(raw_station)
    @name = raw_station["station_name"]
  end
end
