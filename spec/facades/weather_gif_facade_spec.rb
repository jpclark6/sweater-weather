require 'rails_helper'

describe 'getting weather gifs based on location' do
  it 'can build weather gif objects' do
    city_state = 'denver,co'
    weather_gifs = WeatherGifFacade.new(city_state)
    expect(weather_gifs.build_day(0)).to be_instance_of(WeatherGif)
    expect(weather_gifs.build_day(2)).to be_instance_of(WeatherGif)
    expect(weather_gifs.build_day(4)).to be_instance_of(WeatherGif)
    expect(weather_gifs.build_day(0).gif).to include('.gif')
    expect(weather_gifs.build_day(0).time).to include('1')
    expect(weather_gifs.build_day(0).summary).to be_instance_of(String)
    expect(weather_gifs.build_day(3).gif).to include('.gif')
    expect(weather_gifs.build_day(3).time).to include('1')
    expect(weather_gifs.build_day(3).summary).to be_instance_of(String)
  end
end