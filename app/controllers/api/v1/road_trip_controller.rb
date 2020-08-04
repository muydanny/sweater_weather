class Api::V1::RoadTripController < ApplicationController

  def create
    require 'pry'; binding.pry
    user = User.where(params[:api_key]).first
    weather_info = OpenWeatherService.new.get_forecast(road_trip_params[:destination])
    road_trip_info = MapquestService.new.road_trip(road_trip_params[:origin], road_trip_params[:destination])
    destination = Destination.new(weather_info, road_trip_info)
    
    render json: RoadTripSerializer.new(Destination.new(weather_info, road_trip_info))
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

end