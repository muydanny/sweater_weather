require 'rails_helper'

describe "Forecast via location API" do
  it "can get forecast for a location", :vcr do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    
    body = JSON.parse(response.body)
    
    expect(body["data"]["attributes"]["current_weather_description"]).to eq("light rain")
    expect(body["data"]["attributes"]["current_temp"]).to eq(75.67)
    expect(body["data"]["attributes"]["current_date_and_time"]).to eq(1596512392)
    expect(body["data"]["attributes"]["current_high"]).to eq(75.67)
    expect(body["data"]["attributes"]["current_low"]).to eq(74.34)
    expect(body["data"]["attributes"]["feels_like"]).to eq(65.32)
    expect(body["data"]["attributes"]["humidity"]).to eq(33)
    expect(body["data"]["attributes"]["visibility"]).to eq(10000)
    expect(body["data"]["attributes"]["uv_index"]).to eq(10.81)
    expect(body["data"]["attributes"]["sunrise"]).to eq(1596456076)
    expect(body["data"]["attributes"]["sunset"]).to eq(1596507046)
    expect(body["data"]["attributes"]["hourly_time"]).to eq(1596510000)
    expect(body["data"]["attributes"]["hourly_temp"]).to eq(75.67)
    expect(body["data"]["attributes"]["daily_weather_description"]).to eq("light rain")
    expect(body["data"]["attributes"]["daily_precipitation"]).to eq(0.27)
    expect(body["data"]["attributes"]["daily_high"]).to eq(75.67)
    expect(body["data"]["attributes"]["daily_low"]).to eq(74.34)
  end
  
end