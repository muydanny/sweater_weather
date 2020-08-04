class Api::V1::ForecastController < ApplicationController

  def index
    mapquest_response = MapquestService.new.get_lat_long(location_params[:location])
    open_weather_response = OpenWeatherService.new.get_forecast(mapquest_response)
   
    render json: OpenWeatherSerializer.new(Weather.new(open_weather_response)).serialized_json
  end

  private
  
  def location_params
    params.permit(:location)
  end
end