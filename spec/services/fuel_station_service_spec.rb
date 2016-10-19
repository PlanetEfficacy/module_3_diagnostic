require 'rails_helper'

describe FuelStationService do
  it "gets 10 stations from a zipcode" do
    service = FuelStationService.new(80203)
    stations = service.stations
    expect(stations.count).to eq(10)
    expect(stations.first["station_name"]).to eq("UDR")
  end
end
