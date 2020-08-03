class HikingProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :trail_name, :trail_summary, :trail_difficulty, :trail_location, :current_location_weather_summary, :current_location_temp, :distance_to_trail
end