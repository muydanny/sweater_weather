require 'rails_helper'

describe "Forecast via location API" do
  it "can get forecast for a location", :vcr do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    
    body = JSON.parse(response.body)
    
    expect(body["data"]["attributes"]["current_weather_description"]).to be_a(String)
    expect(body["data"]["attributes"]["current_temp"]).to be_a(Float)
    expect(body["data"]["attributes"]["current_date_and_time"]).to be_an(Integer)
    expect(body["data"]["attributes"]["current_high"]).to be_a(Float)
    expect(body["data"]["attributes"]["current_low"]).to be_a(Float)
    expect(body["data"]["attributes"]["feels_like"]).to be_a(Float)
    expect(body["data"]["attributes"]["humidity"]).to_not eq(nil)
    expect(body["data"]["attributes"]["visibility"]).to be_a(Integer)
    expect(body["data"]["attributes"]["uv_index"]).to be_a(Float)
    expect(body["data"]["attributes"]["sunrise"]).to be_a(Integer)
    expect(body["data"]["attributes"]["sunset"]).to be_a(Integer)
    expect(body["data"]["attributes"]["hourly_time"]).to be_a(Integer)
    expect(body["data"]["attributes"]["hourly_temp"]).to be_a(Float)
    expect(body["data"]["attributes"]["daily_weather_description"]).to be_a(String)
    expect(body["data"]["attributes"]["daily_precipitation"]).to be_a(Float)
    expect(body["data"]["attributes"]["daily_high"]).to be_a(Float)
    expect(body["data"]["attributes"]["daily_low"]).to be_a(Float)
  end
  
end