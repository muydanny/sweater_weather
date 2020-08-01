class Api::V1::ForecastController < ApplicationController

  def index
    # location_info =
    map_info = MapquestService.new.get_directions(params[:location])
    open_weather_info = OpenWeatherService.new.get_forecast(map_info)
    # location = params[:location]
    # conn = Faraday.new(url: "api.openweathermap.org") do |faraday|
    #   faraday.params["appid"] = ENV["OPEN_WEATHER_KEY"]
    # end

    # response = conn.get("/data/2.5/onecall?#{location}")
  end
end