require 'rails_helper'

describe "As a user I can see the forecast of a city" do
  xit "retrieve weather for todays forecast" do

    visit '/'
    
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Login')
    expect(page).to have_content('Sweater Weather')

    within(".todays-forecast") do 
      expect(page).to have_css('.city')
      city = find('.city').value
      expect(name).not_to be_empty

      expect(page).to have_css('.state')
      state = find('.state').value
      expect(state).not_to be_empty

      expect(page).to have_css('.weather_description')
      expect(page).to have_css('.temp')
      expect(page).to have_css('.temp_high')
      expect(page).to have_css('.temp_low')
      expect(page).to have_css('.date')
      expect(page).to have_css('.time')

      expect(page).to have_content('Change Location')
      expect(page).to have_content('Favorite')
    end
  end
end

