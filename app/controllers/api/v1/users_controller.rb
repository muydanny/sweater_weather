require 'securerandom'
class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: UsersSerializer.new(new_user).serialized_json, :status => 201
    else
      # error
    end
    #  render json: UserSerializer.new(User.create(user_params))
  end

  private

  def user_params
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    user_params.merge({api_key: SecureRandom.hex(10)})
  end
end