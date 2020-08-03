class Trail

  attr_reader :id,
              :trail_name,
              :trail_summary,
              :trail_difficulty,
              :trail_location,
              :current_location_weather_summary,
              :current_location_temp

  def initialize(trail_info, weather_info)
    @id = nil
    @trail_name = trail_info[:trails][0][:name]
    @trail_summary = trail_info[:trails][0][:summary]
    @trail_difficulty = trail_info[:trails][0][:difficulty]
    @trail_location = trail_info[:trails][0][:location]
    @current_location_weather_summary = weather_info[:current][:weather][0][:description]
    @current_location_temp = weather_info[:current][:temp]
    #NOTE: can use the trail location to find distance from starting location
  end
end