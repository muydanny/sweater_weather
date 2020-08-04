require 'securerandom'
class Api::V1::UsersController < ApplicationController

  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: UsersSerializer.new(new_user).serialized_json, :status => 201
    else
      render json: new_user.errors, :status => 400
    end
  end

  private

  def user_params
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    user_params.merge({api_key: SecureRandom.hex(10)})
  end
end