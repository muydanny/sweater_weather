class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.where(params[:api_key]).first
    road_trip_info = MapquestService.new.road_trip(params[:road_trip][:origin], params[:road_trip][:destination])
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end

end