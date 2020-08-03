require 'rails_helper'

describe "Forecast for nearby trails" do
  it "can get a trails for a location", :vcr do

    get "/api/v1/trails?location=denver,co"
    expect(response).to be_successful  
    body = JSON.parse(response.body)
    
    expect(body["data"]["attributes"]["trail_name"]).to eq("Boulder Skyline Traverse")
    expect(body["data"]["attributes"]["trail_summary"]).to eq("The classic long mountain route in Boulder.")
    expect(body["data"]["attributes"]["trail_difficulty"]).to eq("black")
    expect(body["data"]["attributes"]["trail_location"]).to eq("Superior, Colorado")
  end 
end



# You will build an endpoint that will retrieve the forecast 
# for a location and nearby trails with the distance to each trail.
# current forecast for the start location
# estimated travel time for each trail