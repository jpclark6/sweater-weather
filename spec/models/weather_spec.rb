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
            daily: }
  end
end