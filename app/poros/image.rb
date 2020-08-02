class Image

  attr_reader :id,
              :location_background_image

  def initialize(background_image)
    @id = nil
    @location_background_image = background_image
  end
end