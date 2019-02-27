require 'rails_helper'

describe 'as a user' do
  it 'can favorite locations', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    location = "Denver, CO"

    post "/api/v1/favorites", params: { api_key: api_key, location: location }

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:data][0][:location]).to eq(location)
  end
  it 'can not favorite locations with wrong api info', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    location = "Denver, CO"

    post "/api/v1/favorites", params: {api_key: "#{api_key}x", location: location}

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Something went wrong.")
  end
  it 'can not favorite locations with no api info', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: "#{api_key}")
    location = "Denver, CO"

    post "/api/v1/favorites", params: {location: location}

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Something went wrong.")
  end
  it 'can not favorite add same location twice', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    location = "Denver, CO"

    post "/api/v1/favorites", params: {api_key: api_key, location: location}
    loc = user.locations.last
    post "/api/v1/favorites", params: {api_key: api_key, location: location}
    expect(user.locations.last.id).to eq(loc.id)
  end
end