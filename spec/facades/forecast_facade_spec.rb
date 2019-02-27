require 'rails_helper'

describe 'as a forecast facade' do
  it 'can parse out current weather and not fail with cached data', :vcr do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.current_temp).to be_between(-10, 105).inclusive
    expect(weather.current_feels_like).to be_between(-10, 105).inclusive
    expect(weather.current_humidity).to be_between(0, 1.0).inclusive
    expect(weather.current_visibility_mi).to be_between(0, 30).inclusive
    expect(weather.current_uv_index).to be_between(0, 10).inclusive
    expect(weather.current_status).to be_instance_of(String)
    expect(weather.current_time).to be_between(1550848000, 1750948000).inclusive
    
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.current_temp).to be_between(-10, 105).inclusive
    expect(weather.current_feels_like).to be_between(-10, 105).inclusive
    expect(weather.current_humidity).to be_between(0, 1.0).inclusive
    expect(weather.current_visibility_mi).to be_between(0, 30).inclusive
    expect(weather.current_uv_index).to be_between(0, 10).inclusive
    expect(weather.current_status).to be_instance_of(String)
    expect(weather.current_time).to be_between(1550848000, 1750948000).inclusive
  end
  it 'can give you hourly temp forecast', :vcr do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.hourly_time).to be_between(1550848000, 1750948000).inclusive
    expect(weather.hourly_temperature).to be_between(-10, 105).inclusive
    expect(weather.hourly_time(1)).to be_between(1550848000, 1750948000).inclusive
    expect(weather.hourly_temperature(1)).to be_between(-10, 105).inclusive
    expect(weather.hourly_time(7)).to be_between(1550848000, 1750948000).inclusive
    expect(weather.hourly_temperature(7)).to be_between(-10, 105).inclusive
  end
  it 'can tell you the high, low, and daily description', :vcr do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.high).to be_between(-10, 105).inclusive
    expect(weather.low).to be_between(-10, 105).inclusive
    expect(weather.status).to be_instance_of(String)
    expect(weather.tonight_status).to be_instance_of(String)
    expect(weather.daily_time).to be_between(1550848000, 1750948000).inclusive
  end
  it 'can give you the weekly forecast', :vcr do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.status(1)).to be_instance_of(String)
    expect(weather.humidity(1)).to be_between(0, 1.0).inclusive
    expect(weather.high(1)).to be_between(-10, 105).inclusive
    expect(weather.low(1)).to be_between(-10, 105).inclusive
    
    expect(weather.status(2)).to be_instance_of(String)
    expect(weather.humidity(2)).to be_between(0, 1.0).inclusive
    expect(weather.high(2)).to be_between(-10, 105).inclusive
    expect(weather.low(2)).to be_between(-10, 105).inclusive
    
    expect(weather.status(3)).to be_instance_of(String)
    expect(weather.humidity(3)).to be_between(0, 1.0).inclusive
    expect(weather.high(3)).to be_between(-10, 105).inclusive
    expect(weather.low(3)).to be_between(-10, 105).inclusive
    
    expect(weather.status(4)).to be_instance_of(String)
    expect(weather.humidity(4)).to be_between(0, 1.0).inclusive
    expect(weather.high(4)).to be_between(-10, 105).inclusive
    expect(weather.low(4)).to be_between(-10, 105).inclusive
    
    expect(weather.status(5)).to be_instance_of(String)
    expect(weather.humidity(5)).to be_between(0, 1.0).inclusive
    expect(weather.high(5)).to be_between(-10, 105).inclusive
    expect(weather.low(5)).to be_between(-10, 105).inclusive
  end
  it 'saves weather info to the db for caching' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    id = WeatherLog.last.id
    expect(WeatherLog.last.lat_lng).to eq(lat_lng)

    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(WeatherLog.last.lat_lng).to eq(lat_lng)
    expect(WeatherLog.last.id).to eq(id)
  end
end