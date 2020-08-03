require 'rails_helper'

describe "Registration" do
  it "can register a new user" do

    post '/api/v1/users'

    expect(response).to be_successful  
      
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