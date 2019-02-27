require 'rails_helper'

describe 'as a registered user' do
  it 'can log in with correct info' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/sessions", params: {email: email, password: password}

    expect(response).to be_successful
    expect(status).to eq(200)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:api_key]).to eq(api_key)
  end
  it 'can not log in with wrong info' do
    email = 'example@example.com'
    password = 'password'
    wrong_password = 'password2'
    api_key = 'abc123'
    user = User.create(email: email, password: wrong_password, api_key: api_key)
    post "/api/v1/sessions?email=#{email}&password=#{password}"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Login failed.")
  end
  it 'can not log in with wrong email' do
    email = 'example@example.com'
    wrong_email = 'example2@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/sessions?email=#{wrong_email}&password=#{password}"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Login failed.")
  end
end