require 'rails_helper'

describe 'as a forecast facade' do
  it 'can parse out current weather' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.weather.current_temp).to be_between(-10, 105).inclusive
    expect(weather.weather.current_feels_like).to be_between(-10, 105).inclusive
    expect(weather.weather.current_humidity).to be_between(0, 100).inclusive
    expect(weather.weather.current_visibility_mi).to be_between(0, 50).inclusive
    expect(weather.weather.current_uv_index).to be_between(0, 10).inclusive
    expect(weather.weather.current_status).to be_instance_of(String)
  end
  it 'can tell you the high, low, and daily description' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.weather.today_high).to be_between(-10, 105)
    expect(weather.weather.today_low).to be_between(-10, 105)
    expect(weather.weather.today_status).to be_instance_of(String)
    expect(weather.weather.tonight_status).to be_instance_of(String)
  end
  it 'can give you the weekly forecast' do
    lat_lng = "39.7392358,-104.990251"
    weather = ForecastFacade.new(lat_lng).weather
    expect(weather.weather.future_status(1)).to be_instance_of(String)
    expect(weather.weather.future_humidity(1)).to be_instance_of(String)
    expect(weather.weather.future_high(1)).to be_between(-10, 105).inclusive
    expect(weather.weather.future_low(1)).to be_between(-10, 105).inclusive
    
    expect(weather.weather.future_status(2)).to be_instance_of(String)
    expect(weather.weather.future_humidity(2)).to be_instance_of(String)
    expect(weather.weather.future_high(2)).to be_between(-10, 105).inclusive
    expect(weather.weather.future_low(2)).to be_between(-10, 105).inclusive
    
    expect(weather.weather.future_status(3)).to be_instance_of(String)
    expect(weather.weather.future_humidity(3)).to be_instance_of(String)
    expect(weather.weather.future_high(3)).to be_between(-10, 105).inclusive
    expect(weather.weather.future_low(3)).to be_between(-10, 105).inclusive
    
    expect(weather.weather.future_status(4)).to be_instance_of(String)
    expect(weather.weather.future_humidity(4)).to be_instance_of(String)
    expect(weather.weather.future_high(4)).to be_between(-10, 105).inclusive
    expect(weather.weather.future_low(4)).to be_between(-10, 105).inclusive
    
    expect(weather.weather.future_status(5)).to be_instance_of(String)
    expect(weather.weather.future_humidity(5)).to be_instance_of(String)
    expect(weather.weather.future_high(5)).to be_between(-10, 105).inclusive
    expect(weather.weather.future_low(5)).to be_between(-10, 105).inclusive
  end
end