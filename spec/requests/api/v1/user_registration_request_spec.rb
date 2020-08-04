require 'rails_helper'

describe "Registration API" do
  it "can register a new user" do
    user_params = { email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post '/api/v1/users', params: {user: user_params}
    
    expect(response).to be_successful  
    
    json = JSON.parse(response.body)
    user = User.last

    expect(json["data"]["type"]).to eq("users")
    expect(json["data"]["attributes"]["email"]).to eq(user.email)
    expect(user.api_key).to be_a(String)
    expect(response).to have_http_status(201)
  end 

  it "can get a 400 level status code if password confirmation doesnt match" do 
    user_params = { email: "whatever@example.com", password: "password", password_confirmation: "password123"}
    post '/api/v1/users', params: {user: user_params}

    expect(response).to_not be_successful  
    expect(response).to have_http_status(400)
  end

  it "can get a 400 level status code if password is left blank" do 
    user_params = { email: "whatever@example.com", password: "", password_confirmation: ""}
    post '/api/v1/users', params: {user: user_params}

    expect(response).to_not be_successful  
    expect(response).to have_http_status(400)
  end
end
