class Destination

  def initialize(road_trip_route, weather_info, road_trip_info)
    require 'pry'; binding.pry
    @origin = road_trip_route[:origin]
    @destination = road_trip_route[:destination]
    @travel_time = road_trip_info[:route][:formattedTime]
    @arrival_forecast_temp =
    @arrival_forecast_description 
  end
end