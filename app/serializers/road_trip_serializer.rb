class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :road_trip_route,
             :weather_info,
             :road_trip_info,
             :weather_info,
             :road_trip_info,
             :orign,
             :destination,
             :travel_time,
             :arrival_forecast_temp,
             :arrival_forecast_description
end