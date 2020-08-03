require 'rails_helper'

describe "Retrieve the forecast for a location and nearby trails" do
  it "can get trails for a location", :vcr do

    get "/api/v1/trails?location=denver,co"
    expect(response).to be_successful  
    body = JSON.parse(response.body)
    
    expect(body["data"]["attributes"]["trail_name"]).to eq("Boulder Skyline Traverse")
    expect(body["data"]["attributes"]["trail_summary"]).to eq("The classic long mountain route in Boulder.")
    expect(body["data"]["attributes"]["trail_difficulty"]).to eq("black")
    expect(body["data"]["attributes"]["trail_location"]).to eq("Superior, Colorado")
  end 
  
  it "can get the forecast for the current location", :vcr do 

    get "/api/v1/trails?location=denver,co"
    expect(response).to be_successful  
    body = JSON.parse(response.body)
    
    expect(body["data"]["attributes"]["current_location_weather_summary"]).to eq("few clouds")
    expect(body["data"]["attributes"]["current_location_temp"]).to eq(76.6)
  end

  it "can get the distance to the trail", :vcr do 
    get "/api/v1/trails?location=denver,co"
    expect(response).to be_successful  
    body = JSON.parse(response.body)
    
    expect(body["data"]["attributes"]["distance_to_trail"]).to eq(880.5239)
  end
end
