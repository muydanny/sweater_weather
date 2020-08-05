class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :origin,
             :destination,
             :travel_time,
             :arrival_forecast_temp,
             :arrival_forecast_description
end
