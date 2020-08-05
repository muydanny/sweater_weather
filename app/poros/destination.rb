require 'dotiw'

include ActionView::Helpers::DateHelper
include ActionView::Helpers::TextHelper
include ActionView::Helpers::NumberHelper
class Destination

  attr_reader :road_trip_route,
              :weather_info,
              :road_trip_info,
              :id,
              :weather_info,
              :road_trip_info,
              :orign,
              :destination,
              :travel_time,
              :arrival_forecast_temp,
              :arrival_forecast_description

  def initialize(road_trip_route, weather_info, road_trip_info)
    @id = nil
    @weather_info = weather_info
    @road_trip_info = road_trip_info
    @origin = road_trip_route[:origin]
    @destination = road_trip_route[:destination]
    @travel_time = road_trip_duration
    @arrival_forecast_temp = arrival_forecast_temp
    @arrival_forecast_description = arrival_forecast_description
  end
  
  def road_trip_duration 
    time_as_string = road_trip_info[:route][:formattedTime].to_time.to_s
    distance_of_time_in_words( Time.parse(time_as_string).to_i - Time.parse('0 hours').to_i)
  end

  def arrival_forecast_temp
    t = road_trip_info[:route][:formattedTime].to_time
    diff = ((Time.now - t) / 1.hour).round
    weather_info[:hourly][diff - 1][:temp]
  end

  def arrival_forecast_description
    t = road_trip_info[:route][:formattedTime].to_time
    diff = ((Time.now - t) / 1.hour).round
    weather_info[:hourly][diff - 1][:weather][0][:description]
  end
end

