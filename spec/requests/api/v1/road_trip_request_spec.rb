require 'rails_helper'
require 'securerandom'

describe "Road Trip API" do
  it "can give user origin, destination, and api key", :vcr do

    @user = create(:user)
    user_params = { email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post '/api/v1/sessions', params: {user: user_params}
    json = JSON.parse(response.body, symbolize_names: true)
    api_key = json[:data][:attributes][:api_key]
    
    road_trip_params = { origin: "denver,co", destination: "pueblo,co", api_key: api_key }
    post '/api/v1/road_trip', params: {road_trip: road_trip_params}

    expect(response).to be_successful  
    json = JSON.parse(response.body)
    
    expect(json["data"]["attributes"]["origin"]).to eq("denver,co")
    expect(json["data"]["attributes"]["destination"]).to eq("pueblo,co")
    expect(json["data"]["attributes"]["travel_time"]).to eq("1 hour, 43 minutes, and 57 seconds")
    expect(json["data"]["attributes"]["arrival_forecast_temp"]).to be_a(Float)
    expect(json["data"]["attributes"]["arrival_forecast_description"]).to be_a(String)
  end 

  it 'returns error without proper credentials' do
    api_key = "notanapikey"
    road_trip_params = { origin: "denver,co", destination: "pueblo,co", api_key: api_key }
    post '/api/v1/road_trip', params: {road_trip: road_trip_params}

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq("Unauthorized")
  end 

end

