require 'rails_helper'

describe 'google geocode service' do
  it 'can get latitude and longitude json from location', :vcr do
    location = 'denver,co'
    data = GoogleGeocodeService.new(location).lat_lng
    lat = 39.7392358
    lng = -104.990251
    expect(data.keys).to eq([:results, :status])
    expect(data[:results][0][:geometry][:location].keys).to eq([:lat, :lng])
    expect(data[:results][0][:geometry][:location][:lat]).to eq(lat)
    expect(data[:results][0][:geometry][:location][:lng]).to eq(lng)
  end
end
