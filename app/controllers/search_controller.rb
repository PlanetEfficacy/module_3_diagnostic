class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    raw_response = conn.get do |req|
      req.url '/api/alt-fuel-stations/v1.json'
      req.params['fuel_type'] = 'LPG,ELEC'
      req.params['fuel_type'] = 'LPG,ELEC'
      req.params['zip'] = '80203'
      req.params['limit'] = '10'
      req.params['radius'] = '6.0'
      req.params['api_key'] = 'I6JZ4q6YZSgnPLrcuOM3smCSaG80m2YFHkmyo2uq'
      req.params['format'] = 'JSON'
    end

    response = JSON.parse(raw_response.body)

    @stations = response["fuel_stations"]
    binding.pry
    # https://developer.nrel.gov/api/alt-fuel-stations/v1.json?fuel_type=LPG,ELEC&zip=80203&limit=10&radius=6.0&limit=10&api_key=I6JZ4q6YZSgnPLrcuOM3smCSaG80m2YFHkmyo2uq&format=JSON
  end
end
