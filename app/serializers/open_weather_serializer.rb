class OpenWeatherSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :current_weather_description, :current_temp, :current_date_and_time, :current_high, :current_low, :feels_like, :humidity, :visibility, :uv_index, :sunrise, :sunset, :hourly_time, :hourly_temp, :daily_weather_description, :daily_precipitation, :daily_high, :daily_low
end