require 'rails_helper'

describe "Forecast via location API" do
  it "can get a background image for a city", :vcr do

    get "/api/v1/background?location=denver,co"
    expect(response).to be_successful  
    body = JSON.parse(response.body)
    expect(body["data"]["attributes"]["location_background_image"]).to be_a(String)
    # NOTE: URL image is of wide-angle shot of Denver skyline
  end 
end