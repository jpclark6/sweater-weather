require 'rails_helper'

describe 'getting a gif' do
  it 'exists' do
    weather_description = "Partly cloudy throughout the day."
    gif_facade = GifFacade.new(weather_description)
    expect(gif_facade).to be_instance_of(GifFacade)
  end

  it 'can get a gif based on weather', :vcr do
    weather_description = "Partly cloudy throughout the day."
    gif = GifFacade.new(weather_description).get_gif
    expect(gif).to include('.gif')
  end

  it 'can get a gif based on different weather', :vcr do
    weather_description = "Sunny forever"
    gif = GifFacade.new(weather_description).get_gif
    expect(gif).to include('.gif')
  end

  it 'can get a gif based on another weather', :vcr do
    weather_description = "Winter is coming"
    gif = GifFacade.new(weather_description).get_gif
    expect(gif).to include('.gif')
  end
end