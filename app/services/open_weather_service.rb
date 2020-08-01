class OpenWeatherService
  def get_forecast(location)
    response = conn.get("/data/2.5/onecall?#{location}") do |req|
      req.params["appid"] = ENV["OPEN_WEATHER_KEY"]
      req.params["location"] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("api.openweathermap.org") do |req|
      req.params["appid"] = ENV["OPEN_WEATHER_KEY"]
      req.params["exclude"] = "minutely"
      req.params["unit"] = "imperial"
    end
  end
end

