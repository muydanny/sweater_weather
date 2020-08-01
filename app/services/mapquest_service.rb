class MapquestService
  def get_lat_long(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params["key"] = ENV["MAP_KEY"]
      req.params["location"] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com") do |req|
      req.params["key"] = ENV["MAP_KEY"]
    end
  end
end
# "latLng"=>{"lat"=>39.738453, "lng"=>-104.984853}