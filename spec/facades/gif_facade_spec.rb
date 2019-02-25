require 'rails_helper'

describe 'getting a gif' do
  it 'can get a gif based on weather' do
    weather_description = "Partly cloudy throughout the day."
    gif = GifFacade.new(weather_description).get_gif
    expect(gif).to include('.gif')
  end
end