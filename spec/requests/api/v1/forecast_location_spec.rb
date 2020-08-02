require 'rails_helper'

describe "Forecast via location API" do
  it "can get forecast for a location" do
    VCR.use_cassette('forecast_for_city') do
      get "/api/v1/forecast?location=denver,co"

      expect(response).to be_successful
      
      body = JSON.parse(response.body)

      # set up VCR
      # and actually assert on the values

      expect(body["data"]["attributes"]["current_weather_description"]).to eq("scattered clouds")
      expect(body["data"]["attributes"]["current_temp"]).not_to be(nil)
      expect(body["data"]["attributes"]["current_date_and_time"]).not_to be(nil)
      expect(body["data"]["attributes"]["current_high"]).not_to be(nil)
      expect(body["data"]["attributes"]["current_low"]).not_to be(nil)
      expect(body["data"]["attributes"]["feels_like"]).not_to be(nil)
      expect(body["data"]["attributes"]["humidity"]).not_to be(nil)
      expect(body["data"]["attributes"]["visibility"]).not_to be(nil)
      expect(body["data"]["attributes"]["uv_index"]).not_to be(nil)
      expect(body["data"]["attributes"]["sunrise"]).not_to be(nil)
      expect(body["data"]["attributes"]["sunset"]).not_to be(nil)
      expect(body["data"]["attributes"]["hourly_time"]).not_to be(nil)
      expect(body["data"]["attributes"]["hourly_temp"]).not_to be(nil)
      expect(body["data"]["attributes"]["daily_weather_description"]).not_to be(nil)
      expect(body["data"]["attributes"]["daily_precipitation"]).not_to be(nil)
      expect(body["data"]["attributes"]["daily_high"]).not_to be(nil)
      expect(body["data"]["attributes"]["daily_low"]).not_to be(nil)
    end
  end
end