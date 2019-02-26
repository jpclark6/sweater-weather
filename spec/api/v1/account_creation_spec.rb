require 'rails_helper'

describe 'to create a user' do
  it 'makes a post to the api with user info and receives confirmation back' do
    params = {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    binding.pry



    expect(true).to eq(true)

  end
end