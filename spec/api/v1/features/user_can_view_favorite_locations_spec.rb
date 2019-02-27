require 'rails_helper'

describe 'as a user' do
  it 'can view favorite locations with the weather', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/favorites", params: {api_key: api_key, location: 'Denver, CO'}
    post "/api/v1/favorites", params: {api_key: api_key, location: 'Miami, FL'}
    get "/api/v1/favorites", params: {api_key: api_key}

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:data]).to be_instance_of(Array)
    expect(data[:data][0][:location]).to include(', ')
    expect(data[:data][0][:current_weather]).to be_instance_of(Hash)
    expect(data[:data][1][:location]).to include(', ')
    expect(data[:data][1][:current_weather]).to be_instance_of(Hash)
  end
  it 'does not break when user has no favorites' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    get "/api/v1/favorites", params: {api_key: api_key}

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
 
    expect(data[:data]).to be_instance_of(Array)
    expect(data[:data].empty?).to eq(true)
  end
  it 'returns error when api key is wrong' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: "#{api_key}x")
    get "/api/v1/favorites", params: {api_key: api_key}

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Something went wrong.")
  end
  it 'returns error when no api key is entered' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: "#{api_key}x")
    get "/api/v1/favorites"

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Something went wrong.")
  end
end