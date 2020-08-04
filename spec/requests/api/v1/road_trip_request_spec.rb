require 'rails_helper'
require 'securerandom'

describe "Road Trip API" do
  it "can give user origin, destination, and api key" do

    @user = create(:user)
    user_params = { email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post '/api/v1/sessions', params: {user: user_params}
    json = JSON.parse(response.body, symbolize_names: true)
    api_key = json[:data][:attributes][:api_key]
    
    road_trip_params = { origin: "denver,co", destination: "pueblo,co", api_key: api_key }
    post '/api/v1/road_trip', params: {road_trip: road_trip_params}

    expect(response).to be_successful  
    json = JSON.parse(response.body)
    
  end 

end

