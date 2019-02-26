require 'rails_helper'

describe 'as a user' do
  it 'can favorite locations' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)

    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Favorite added successfully")
  end
  it 'can not favorite locations with wrong api info' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: "#{api_key}x")

    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Something went wrong.")
  end
  it 'can not favorite locations with no api info' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: "#{api_key}")

    post "/api/v1/favorites?location=Denver, CO"

    expect(status).to eq(401)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Something went wrong.")
  end
end