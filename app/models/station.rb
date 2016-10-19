class Station
  attr_reader :station_name,
              :access_days_time,
              :fuel_type_code,
              :distance

  def initialize(raw_station)
    @station_name = raw_station["station_name"]
    @access_days_time = raw_station["access_days_time"]
    @fuel_type_code = raw_station["fuel_type_code"]
    @distance = raw_station["distance"]
  end
end
