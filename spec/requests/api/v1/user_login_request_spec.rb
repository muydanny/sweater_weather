require 'rails_helper'

describe "Login API" do
  it "can login a registered user" do
    user = create(:user)
    user_params = { email: "whatever@example.com", password: "password"}
    post '/api/v1/sessions', params: {user: user_params}
    
    expect(response).to be_successful  
    
    json = JSON.parse(response.body)
    
    expect(json["data"]["type"]).to eq("users")
    expect(json["data"]["attributes"]["email"]).to eq(user.email)
    expect(user.api_key).to be_a(String)
    expect(response).to have_http_status(200)
  end 

  it "returns a 400 level status code with bad credentials" do 
    user_params = { email: "bademail@example.com", password: "password"}
    post '/api/v1/sessions', params: {user: user_params}
    
    expect(response).to_not be_successful  
    json = JSON.parse(response.body)
    
    expect(response).to have_http_status(400)
    expect(json["error"]).to eq("No such user; check the submitted email address")
  end
end
#   POST /api/v1/sessions
# Content-Type: application/json
# Accept: application/json

# {
#   "email": "whatever@example.com",
#   "password": "password"
# }

# status: 200
# body:

# {
#   "data": {
#     "type": "users",
#     "id": "1",
#     "attributes": {
#       "email": "whatever@example.com",
#       "api_key": "jgn983hy48thw9begh98h4539h4"
#     }
#   }
# }