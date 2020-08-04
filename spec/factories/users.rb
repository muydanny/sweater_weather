require 'securerandom'
FactoryBot.define do
  factory :user do 
    email {"whatever@email.com"}
    password {"password"}
    api_key {SecureRandom.hex(10)}
  end
end