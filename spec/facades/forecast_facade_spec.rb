require 'rails_helper'

describe 'as a forecast facade' do
  it 'can parse out current weather' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.current_temp).to be_between(-10, 105).inclusive
    expect(weather.current_feels_like).to be_between(-10, 105).inclusive
    expect(weather.current_humidity).to be_between(0, 1.0).inclusive
    expect(weather.current_visibility_mi).to be_between(0, 30).inclusive
    expect(weather.current_uv_index).to be_between(0, 10).inclusive
    expect(weather.current_status).to be_instance_of(String)
  end
  it 'can tell you the high, low, and daily description' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.high).to be_between(-10, 105)
    expect(weather.low).to be_between(-10, 105)
    expect(weather.status).to be_instance_of(String)
    expect(weather.tonight_status).to be_instance_of(String)
  end
  it 'can give you the weekly forecast' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.status(1)).to be_instance_of(String)
    expect(weather.humidity(1)).to be_instance_of(String)
    expect(weather.high(1)).to be_between(-10, 105).inclusive
    expect(weather.low(1)).to be_between(-10, 105).inclusive
    
    expect(weather.status(2)).to be_instance_of(String)
    expect(weather.humidity(2)).to be_instance_of(String)
    expect(weather.high(2)).to be_between(-10, 105).inclusive
    expect(weather.low(2)).to be_between(-10, 105).inclusive
    
    expect(weather.status(3)).to be_instance_of(String)
    expect(weather.humidity(3)).to be_instance_of(String)
    expect(weather.high(3)).to be_between(-10, 105).inclusive
    expect(weather.low(3)).to be_between(-10, 105).inclusive
    
    expect(weather.status(4)).to be_instance_of(String)
    expect(weather.humidity(4)).to be_instance_of(String)
    expect(weather.high(4)).to be_between(-10, 105).inclusive
    expect(weather.low(4)).to be_between(-10, 105).inclusive
    
    expect(weather.status(5)).to be_instance_of(String)
    expect(weather.humidity(5)).to be_instance_of(String)
    expect(weather.high(5)).to be_between(-10, 105).inclusive
    expect(weather.low(5)).to be_between(-10, 105).inclusive
  end
end