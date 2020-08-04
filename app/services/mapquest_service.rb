class MapquestService
  def get_lat_long(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params["key"] = ENV["MAP_KEY"]
      req.params["location"] = location
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:locations][0][:latLng]
  end

  def road_trip(origin, destination)
    response = conn.get("/directions/v2/route") do |req|
      req.params["from"] = origin
      req.params["to"] = destination
    end
    json = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com") do |req|
      req.params["key"] = ENV["MAP_KEY"]
    end
  end
end
