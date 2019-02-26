require 'rails_helper'

describe 'finding a background image' do
  it 'can get a background image from city/state', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:url]).to include('.jpg')
  end
  it 'can get a background image from a different city/state', :vcr do
    get '/api/v1/backgrounds?location=miami,fl'

    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:url]).to include('.jpg')
  end
end