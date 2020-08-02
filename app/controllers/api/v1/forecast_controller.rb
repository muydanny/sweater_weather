class Api::V1::ForecastController < ApplicationController

  def index
    map_info = MapquestService.new.get_lat_long(params[:location])
    open_weather_info = OpenWeatherService.new.get_forecast(map_info)
    render json: open_weather_info
    
    # render json: OpenWeatherSerializer.new(WeatherInfo(open_weather_info)).serialized_json
  end
end