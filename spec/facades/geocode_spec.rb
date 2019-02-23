require 'rails_helper'

describe 'geocode facade', :vcr do
  it 'can get latitude and longitude from location' do
    location = 'denver,co'
    lat_lng = GeocodeFacade.new(location).lat_lng
    lat = 39.7392358
    lng = -104.990251
    expect(lat_lng).to eq("#{lat},#{lng}")
  end
end
