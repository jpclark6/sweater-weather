require 'rails_helper'

describe 'to create a user' do
  it 'makes a post to the api with user info and receives confirmation back' do
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password"
    post "/api/v1/users?email=#{email}&password=#{password}&password_confirmation=#{password_confirmation}"

    expect(response).to be_successful
    expect(status).to eq(201)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:api_key]).to eq(User.last.api_key)
  end
end