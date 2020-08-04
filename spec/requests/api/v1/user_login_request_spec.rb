require 'rails_helper'

describe "Login API" do
  it "can login a registered user" do
    user_params = { email: "whatever@example.com", password: "password"}
    post '/api/v1/sessions', params: {user: user_params}
    
    expect(response).to be_successful  
    
    json = JSON.parse(response.body)
    user = User.last

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