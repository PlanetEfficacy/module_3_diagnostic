require 'rails_helper'

RSpec.describe Station, :type => :model do

  let(:station) {
    Station.new({
        "access_days_time"=>"24 hours daily",
        "fuel_type_code"=>"ELEC",
        "station_name"=>"UDR",
        "city"=>"Denver",
        "state"=>"CO",
        "street_address"=>"800 Acoma St",
        "zip"=>"80204",
        "distance"=>0.3117
      })
  }

  it "has all the attributes of a station" do
    expect(station.station_name).to eq("UDR")
    expect(station.access_days_time).to eq("24 hours daily")
    expect(station.fuel_type_code).to eq("ELEC")
    expect(station.distance).to eq(0.3117)
  end

  # it "has an address"
end
