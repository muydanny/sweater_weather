require 'rails_helper'

describe "Forecast via location API" do
  it "can get forecast for a location", :vcr do

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful
    
    body = JSON.parse(response.body)

    expect(body["data"]["attributes"]["current_weather_description"]).to eq("scattered clouds")
    expect(body["data"]["attributes"]["current_temp"]).to eq(72.99)
    expect(body["data"]["attributes"]["current_date_and_time"]).to eq(1596386602)
    expect(body["data"]["attributes"]["current_high"]).to eq(83.34)
    expect(body["data"]["attributes"]["current_low"]).to eq(72.18)
    expect(body["data"]["attributes"]["feels_like"]).to eq(70.45)
    expect(body["data"]["attributes"]["humidity"]).to eq(56)
    expect(body["data"]["attributes"]["visibility"]).to eq(10000)
    expect(body["data"]["attributes"]["uv_index"]).to eq(10.3)
    expect(body["data"]["attributes"]["sunrise"]).to eq(1596369620)
    expect(body["data"]["attributes"]["sunset"]).to eq(1596420710)
    expect(body["data"]["attributes"]["hourly_time"]).to eq(1596384000)
    expect(body["data"]["attributes"]["hourly_temp"]).to eq(72.99)
    expect(body["data"]["attributes"]["daily_weather_description"]).to eq("scattered clouds")
    expect(body["data"]["attributes"]["daily_precipitation"]).to eq(0)
    expect(body["data"]["attributes"]["daily_high"]).to eq(83.34)
    expect(body["data"]["attributes"]["daily_low"]).to eq(72.18)
  end
  
end