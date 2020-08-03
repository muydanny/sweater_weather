class Api::V1::TrailController < ApplicationController

  def index
    map_info = MapquestService.new.get_lat_long(params[:location])
    trail_info = HikingProjectService.new.get_trails(map_info)
    weather_info = OpenWeatherService.new.get_forecast(map_info)
    distance_info = MapquestService.new.get_distance(params[:location], trail_info)
    render json: HikingProjectSerializer.new(Trail.new(trail_info, weather_info, distance_info)).serialized_json
  end
end