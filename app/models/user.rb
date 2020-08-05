class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true 
  validates :password_digest, presence: true
  validates :api_key, presence: true
  has_secure_password
  
  has_many :road_trips
end