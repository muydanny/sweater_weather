class UnsplashService
  def get_image(location)
    response = conn.get("/search/photos") do |req|
      req.params["query"] = location
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:urls][:full]
  end

  private

  def conn
    Faraday.new("https://api.unsplash.com") do |req|
      req.params["client_id"] = ENV["UNSPLASH_KEY"]
      req.headers["Accept-Version"]= 'v1'
    end
  end
end