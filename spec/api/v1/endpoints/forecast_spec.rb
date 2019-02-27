require 'rails_helper'

describe 'as a visitor' do
  it 'can get a successful call to the forecast endpoint', :vcr do
    get '/api/v1/forecast', params: {location: "denver,co"}
    
    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:data].keys).to eq([:currently, :hourly, :daily])
    expect(data[:data][:currently].keys).to eq([:time, :temperature, :feels_like, :humidity, :visibility, :uv_index, :description, :icon])
    expect(data[:data][:hourly][0].keys).to eq([:time, :temperature, :icon])
    expect(data[:data][:hourly][23].keys).to eq([:time, :temperature, :icon])
    expect(data[:data][:daily][0].keys).to eq([:time, :high, :low, :status, :tonight_status, :humidity, :icon])
    expect(data[:data][:daily][6].keys).to eq([:time, :high, :low, :status, :tonight_status, :humidity, :icon])
  end
  
  it 'can cache a successful call to the forecast endpoint', :vcr do
    get '/api/v1/forecast', params: {location: "denver,co"}
    get '/api/v1/forecast', params: {location: "denver,co"}
    
    expect(WeatherLog.last).to_not eq(nil)
  end
end