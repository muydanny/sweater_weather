require 'rails_helper'

describe "Forecast via location API" do
  it "can get a background image for a city", :vcr do

    get "/api/v1/background?location=denver,co"
    expect(response).to be_successful  
    body = JSON.parse(response.body)
    expect(body["data"]["attributes"]["location_background_image"]).to eq("https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjE1MzkzOH0")
    # NOTE: URL image is of wide-angle shot of Denver skyline
  end 
end