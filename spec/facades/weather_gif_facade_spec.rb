require 'rails_helper'

describe 'getting weather gifs based on location' do
  it 'can build weather gif objects' do
    city_state = 'denver,co'
    weather_gifs = WeatherGifFacade.new(city_state)
    expect(weather_gifs.build_days[0]).to be_instance_of(WeatherGif)
    expect(weather_gifs.build_days[3]).to be_instance_of(WeatherGif)
    expect(weather_gifs.build_days[6]).to be_instance_of(WeatherGif)
    expect(weather_gifs.build_days[0].gif).to include('.gif')
    expect(weather_gifs.build_days[0].time).to include('1')
    expect(weather_gifs.build_days[0].summary).to be_instance_of(String)
    expect(weather_gifs.build_days[4].gif).to include('.gif')
    expect(weather_gifs.build_days[4].time).to include('1')
    expect(weather_gifs.build_days[4].summary).to be_instance_of(String)
  end
end