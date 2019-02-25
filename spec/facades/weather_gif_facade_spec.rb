require 'rails_helper'

describe 'getting weather gifs based on location' do
  it 'can build weather gif objects' do
    city_state = 'denver,co'
    weather_gif_by_day = WeatherGifFacade.new(city_state).build_days
    expect(weather_gif_by_day).to be_instance_of(WeatherGif)
    expect(weather_gif_by_day).to be_instance_of(WeatherGif)
    expect(weather_gif_by_day).to be_instance_of(WeatherGif)
    expect(weather_gif_by_day.gif).to include('.gif')
    expect(weather_gif_by_day.time).to be_instance_of(Integer)
    expect(weather_gif_by_day.summary).to be_instance_of(String)
    expect(weather_gif_by_day.gif).to include('.gif')
    expect(weather_gif_by_day.time).to be_instance_of(Integer)
    expect(weather_gif_by_day.summary).to be_instance_of(String)
  end
end