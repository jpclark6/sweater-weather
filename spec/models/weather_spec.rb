require 'rails_helper'

describe 'weather' do
  it 'exists' do
    weather = Weather.new('data')
    expect(weather).to be_instance_of(Weather)
  end

  it 'contains weather data' do
    data = {currently: {temperature: 80, apparentTemperature: 80, humidity: 0.5,
                        visibility: 2, uvIndex: 5, summary: 'Bad', time: 4923},
            hourly: {data: [{time: 5, temperature: 45}]},
            daily: {data: [{temperatureLow: 4, summary: 'Bad', humidity: 0.5}]}}
    weather = Weather.new(data)
    expect(weather.current_temp).to eq(80)
    expect(weather.current_feels_like).to eq(80)
    expect(weather.current_humidity).to eq(0.5)
    expect(weather.hourly_time).to eq(5)
  end
end