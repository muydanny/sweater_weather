class MapquestService
  
  def get_lat_long(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params["location"] = location
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:locations][0][:latLng]
  end
  
  def get_distance(location, trail_location)
    response = conn.get("/directions/v2/route") do |req|
      req.params["from"] = location
      req.params["to"] = trail_location[:trails][0][:location]
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  BASE_URL = "http://www.mapquestapi.com".freeze

  def conn
    Faraday.new(BASE_URL) do |req|
      req.params["key"] = ENV["MAP_KEY"]
    end
  end
end
