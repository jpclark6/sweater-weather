require 'rails_helper'

describe 'getting weather gifs based on location' do
  it 'exists', :vcr do
    city_state = 'denver,co'
    weather_gif_facade = WeatherGifFacade.new(city_state)
    expect(weather_gif_facade).to be_instance_of(WeatherGifFacade)
  end

  it 'can build weather gif objects', :vcr do
    city_state = 'denver,co'
    weather_gif_by_day = WeatherGifFacade.new(city_state).build_days
    expect(weather_gif_by_day).to be_instance_of(Array)
    expect(weather_gif_by_day[0][:url]).to include('.gif')
    expect(weather_gif_by_day[0][:time]).to be_instance_of(Integer)
    expect(weather_gif_by_day[0][:summary]).to be_instance_of(String)
    expect(weather_gif_by_day[0][:url]).to include('.gif')
    expect(weather_gif_by_day[0][:time]).to be_instance_of(Integer)
    expect(weather_gif_by_day[0][:summary]).to be_instance_of(String)
  end
  
  it 'can build weather gif objects for other cities', :vcr do
    city_state = 'miami,fl'
    weather_gif_by_day = WeatherGifFacade.new(city_state).build_days
    expect(weather_gif_by_day).to be_instance_of(Array)
    expect(weather_gif_by_day[0][:url]).to include('.gif')
    expect(weather_gif_by_day[0][:time]).to be_instance_of(Integer)
    expect(weather_gif_by_day[0][:summary]).to be_instance_of(String)
    expect(weather_gif_by_day[0][:url]).to include('.gif')
    expect(weather_gif_by_day[0][:time]).to be_instance_of(Integer)
    expect(weather_gif_by_day[0][:summary]).to be_instance_of(String)
  end
end