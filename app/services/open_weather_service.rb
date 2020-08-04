class OpenWeatherService
  def get_forecast(location)

    response = conn.get("/data/2.5/onecall") do |req|
      req.params["lat"] = location[:lat]
      req.params["lon"] = location[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://api.openweathermap.org") do |req|
      req.params["appid"] = ENV["OPEN_WEATHER_KEY"]
      req.params["exclude"] = "minutely"
      req.params["units"] = "imperial"
    end
  end
end

