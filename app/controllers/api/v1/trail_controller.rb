class Api::V1::TrailController < ApplicationController

  def index
    map_info = MapquestService.new.get_lat_long(location_params[:location])
    trail_info = HikingProjectService.new.get_trails(map_info)
    weather_info = OpenWeatherService.new.get_forecast(map_info)
    distance_info = MapquestService.new.get_distance(location_params[:location], trail_info)
    
    trail = Trail.new(trail_info, weather_info, distance_info)
    render json: HikingProjectSerializer.new(trail).serialized_json
  end

  private

  def location_params
    params.permit(:location)
  end
  
end