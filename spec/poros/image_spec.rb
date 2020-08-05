require 'rails_helper'

describe Image, :vcr do
  it "exists" do 
    image = Image.new("denver,co")
    expect(image).to be_a(Image)
    expect(image.location_background_image).to be_a(String)
  end
end

