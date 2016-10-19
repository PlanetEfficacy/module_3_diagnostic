class SearchController < ApplicationController
  def index
    service = FuelStationService.new(params[:q])
    @stations = service.stations
  end
end
