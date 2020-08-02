class Api::V1::BackgroundController < ApplicationController

  def show
    location = params[:location]
    background_image = UnsplashService.new.get_image(location)
   
    render json: UnsplashSerializer.new(Image.new(background_image)).serialized_json
  end
end