class Api::V1::ForecastController < ApplicationController

  def index
    require 'pry'; binding.pry
    location = params[:location]

    conn = Faraday.new(url: "api.openweathermap.org") do |faraday|
      faraday.params["appid"] = ENV["OPEN_WEATHER_KEY"]
    end

    response = conn.get("/data/2.5/onecall?#{location}")
  end
end