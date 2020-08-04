class HikingProjectService
  
  def get_trails(location)
    response = conn.get("/data/get-trails") do |req|
      req.params["lat"] = location[:lat]
      req.params["lon"] = location[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  BASE_URL = "https://www.hikingproject.com".freeze

  def conn
    Faraday.new(BASE_URL) do |req|
      req.params["key"] = ENV["HIKING_PROJECT_KEY"]
    end
  end
end