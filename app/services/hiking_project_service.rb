class HikingProjectService
  def get_trails(location)
    response = conn.get("/data/get-trails?lat=#{location[:lat]}&lon=#{location[:lng]}") do |req|
    req.params["key"] = ENV["HIKING_PROJECT_KEY"]
  end
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://www.hikingproject.com") do |req|
      req.params["key"] = ENV["HIKING_PROJECT_KEY"]
    end
  end
end