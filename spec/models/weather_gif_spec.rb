require 'rails_helper'

describe 'weather gif' do
  it 'exists' do 
    expect(WeatherGif.new('weather', 2)).to be_instance_of(WeatherGif)
  end

  it 'returns time, gif, and summary', :vcr do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    weather_gif = WeatherGif.new(weather, 2)
    expect(weather_gif.time).to be_instance_of(Integer)
    expect(weather_gif.gif).to include('gif')
    expect(weather_gif.summary).to be_instance_of(String)
  end
end