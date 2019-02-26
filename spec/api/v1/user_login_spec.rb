require 'rails_helper'

describe 'as a registered user' do
  it 'can log in with correct info' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)
    post "/api/v1/sessions?email=#{email}&password=#{password}"

    expect(response).to be_successful
    expect(status).to eq(200)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:api_key]).to eq(api_key)
  end
end