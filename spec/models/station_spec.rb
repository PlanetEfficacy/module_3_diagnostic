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

  it "has a name" do
    expect(station.name).to eq("UDR")
  end
end
