require 'rails_helper'

describe 'as a user' do
  it 'can delete favorites', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"
    post "/api/v1/favorites?api_key=#{api_key}&location=Miami, FL"

    delete "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data].length).to eq(1)
    expect(data[:data][0][:location]).to eq("Denver, CO")
    expect(data[:data][0][:current_weather][:currently][:temperature]).to be_between(-10, 115).inclusive
  end

  it 'errors out if wrong api key', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"
    post "/api/v1/favorites?api_key=#{api_key}&location=Miami, FL"

    delete "/api/v1/favorites?api_key=#{api_key}x&location=Denver, CO"

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq('Something went wrong')
  end

  it 'errors out if no api key', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"
    post "/api/v1/favorites?api_key=#{api_key}&location=Miami, FL"

    delete "/api/v1/favorites?location=Denver, CO"

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq('Something went wrong')
  end

  it 'errors out if wrong city given', :vcr do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"
    post "/api/v1/favorites?api_key=#{api_key}&location=Miami, FL"

    delete "/api/v1/favorites?api_key=#{api_key}x&location=Nowhere, CO"

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq('Something went wrong')
  end
end