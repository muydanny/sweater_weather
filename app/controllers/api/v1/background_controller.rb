class Api::V1::BackgroundController < ApplicationController

  def show
    background_image = UnsplashService.new.get_image(location_params[:location])
   
    render json: UnsplashSerializer.new(Image.new(background_image)).serialized_json
  end

  private
  
  def location_params
    params.permit(:location)
  end
end