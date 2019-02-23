require 'rails_helper'

describe 'as a visitor' do
  it 'can get a successful call to the forecast endpoint', :vcr do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    # data = JSON.parse(response.body, symbolize_names: true)
  end
end