require 'rails_helper'

describe "Registration" do
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
end


# Request
# {
#   "email": "whatever@example.com",
#   "password": "password"
#   "password_confirmation": "password"
# }

# Response
# status: 201
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