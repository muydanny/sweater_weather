class Api::V1::SessionsController < ApplicationController

  def create
    require 'pry'; binding.pry
    user = User.find_by(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      render json: UsersSerializer.new(user).serialized_json, :status => 201
    else
    # sad path
    end
  end

  private

  def user_params
    user_params = params.permit(:email, :password, :password_confirmation)
  end
end