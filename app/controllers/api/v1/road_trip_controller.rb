class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.where(params[:api_key]).first
    map_info = MapquestService.new.get_lat_long(road_trip_params[:destination])
    weather_info = OpenWeatherService.new.get_forecast(map_info)
    road_trip_info = MapquestService.new.road_trip(road_trip_params[:origin], road_trip_params[:destination])
    
    render json: RoadTripSerializer.new(Destination.new(road_trip_params, weather_info, road_trip_info)).serialized_json
  end

  private

  def road_trip_params
    params.require(:road_trip).permit(:origin, :destination)
  end

end