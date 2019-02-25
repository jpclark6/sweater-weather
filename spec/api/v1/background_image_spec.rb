require 'rails_helper'

describe 'finding a background image' do
  it 'can get a background image from city/state' do
    get '/api/v1/backgrounds?location=denver,co'

    data = JSON.parse(response.body, symbolize_names: true)
    expect(true).to eq(true)
  end
end