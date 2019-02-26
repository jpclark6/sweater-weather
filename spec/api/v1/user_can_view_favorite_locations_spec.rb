require 'rails_helper'

describe 'as a user' do
  it 'can view favorite locations with the weather' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/favorites?api_key=#{api_key}&location=Denver, CO"
    post "/api/v1/favorites?api_key=#{api_key}&location=Miami, FL"
    get "/api/v1/favorites?api_key=#{api_key}"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:data]).to be_instance_of(Array)
    expect(data[:data][0][:location]).to eq("Denver, CO")
    expect(data[:data][0][:current_weather]).to be_instance_of(Hash)
    expect(data[:data][1][:location]).to eq("Miami, FL")
    expect(data[:data][1][:current_weather]).to be_instance_of(Hash)
  end
end