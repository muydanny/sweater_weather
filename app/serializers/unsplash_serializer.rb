class UnsplashSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :location_background_image
end