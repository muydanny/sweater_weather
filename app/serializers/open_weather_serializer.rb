class OpenWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather_description
end