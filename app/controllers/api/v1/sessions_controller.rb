class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(params[:email])
    if user != nil && user.authenticate(params[:user][:password])
      render json: UsersSerializer.new(user).serialized_json, :status => 200
    else
      payload = { error: "No such user; check the submitted email address"}
      render :json => payload, :status => :bad_request
    end
  end
end