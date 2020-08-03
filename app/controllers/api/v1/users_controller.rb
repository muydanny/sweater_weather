require 'securerandom'
class Api::V1::UsersController < ApplicationController

  def create
    render json: User.create(user_params)
  end

  private

  def user_params
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    user_params.merge({api_key: SecureRandom.hex(10)})
  end
end