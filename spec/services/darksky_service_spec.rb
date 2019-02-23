require 'rails_helper'

describe 'darksky api' do
  it 'exists' do
    lat_lng = "39.7392358,-104.990251"
    darksky = DarkskyService.new(lat_lng)
    expect(darksky).to be_instance_of(DarkskyService)
  end

  it 'can get a weather forecast' do
    lat_lng = "39.7392358,-104.990251"
    darksky = DarkskyService.new(lat_lng)
    data = darksky.forecast

    expect(data).to_not eq(nil)
    expect(data.keys).to include(:currently)
    expect(data.keys).to include(:hourly)
    expect(data.keys).to include(:daily)
  end
end