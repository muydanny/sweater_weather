require 'date'

class Weather

  attr_reader :id, 
              :current_weather_description,
              :current_temp,
              :current_date_and_time,
              :current_high,
              :current_low,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :sunrise,
              :sunset,
              :hourly_time,
              :hourly_temp,
              :daily_weather_description,
              :daily_precipitation,
              :daily_high,
              :daily_low

  def initialize(weather_info)
    @id = nil
    @current_weather_description = weather_info[:current][:weather][0][:description]
    @current_temp = weather_info[:current][:temp]
    @current_date_and_time = weather_info[:current][:dt]
    @current_high = weather_info[:daily][0][:temp][:max]
    @current_low = weather_info[:daily][0][:temp][:min]
    @feels_like = weather_info[:current][:feels_like]
    @humidity = weather_info[:current][:humidity]
    @visibility = weather_info[:current][:visibility]
    @uv_index = weather_info[:current][:uvi]
    @sunrise = weather_info[:current][:sunrise]
    @sunset = weather_info[:current][:sunset]
    @hourly_time = weather_info[:hourly][0][:dt]
    @hourly_temp = weather_info[:hourly][0][:temp]
    @daily_weather_description = weather_info[:daily][0][:weather][0][:description]
    @daily_precipitation = weather_info[:daily][0][:rain] || 0
    @daily_high = weather_info[:daily][0][:temp][:max]
    @daily_low = weather_info[:daily][0][:temp][:min]
  end

end