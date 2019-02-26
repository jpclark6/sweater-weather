require 'rails_helper'

describe 'as a giphy service' do
  it 'exists' do
    weather_description = "Partly cloudy throughout the day."
    gif = GiphyService.new(weather_description)
    expect(gif).to be_instance_of(GiphyService)
  end

  it 'returns a json object when called for', :vcr do
    weather_description = "Partly cloudy throughout the day."
    gif = GiphyService.new(weather_description)
    data = gif.gif_data
    expect(data).to be_instance_of(Hash)
    expect(data[:data][0][:images][:original][:url]).to be_instance_of(String)
  end
end
