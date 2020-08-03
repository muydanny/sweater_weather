require 'rails_helper'

describe "Registration" do
  it "can register a new user" do
    user_params = { email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post '/api/v1/users', params: {user: user_params}
    user = User.last
    expect(response).to be_successful  
    expect(user.email).to eq(item_params[:email])
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