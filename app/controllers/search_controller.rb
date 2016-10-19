class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    raw_response = conn.get do |req|
      req.url '/api/alt-fuel-stations/v1/nearest.json'
      req.params['fuel_type'] = 'LPG,ELEC'
      req.params['location'] = '80203'
      req.params['limit'] = '10'
      req.params['radius'] = '6.0'
      req.params['api_key'] = 'I6JZ4q6YZSgnPLrcuOM3smCSaG80m2YFHkmyo2uq'
      req.params['format'] = 'JSON'
    end
    response = JSON.parse(raw_response.body)
    binding.pry
    @stations = response["fuel_stations"]
  end
end
