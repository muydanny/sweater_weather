require 'rails_helper'

describe "Forecast for nearby trails" do
  it "can get a forecast for a nearby trail", :vcr do

    get "/api/v1/trails?location=denver,co"
    expect(response).to be_successful  
    
  end 
end

# You will build an endpoint that will retrieve the forecast 
# for a location and nearby trails with the distance to each trail.

# current forecast for the start location
# name of the trail
# summary of each trail
# difficulty of each trail
# location of each trail
# estimated travel time for each trail