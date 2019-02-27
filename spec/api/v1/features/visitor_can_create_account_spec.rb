require 'rails_helper'

describe 'to create a user' do
  it 'makes a post to the api with user info and receives confirmation back' do
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password"
    post "/api/v1/users", params: {email: email, password: password, password_confirmation: password_confirmation}

    expect(response).to be_successful
    expect(status).to eq(201)
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:api_key]).to eq(User.last.api_key)
  end
  it 'does not create user when account already exists' do
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password"
    post "/api/v1/users", params: {email: email, password: password, password_confirmation: password_confirmation}

    email = "whatever@example.com"
    password = "password2"
    password_confirmation = "password2"
    post "/api/v1/users", params: {email: email, password: password, password_confirmation: password_confirmation}

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Account not created. Error occured.")
  end
  it 'does not create user when account password confirmation does not match' do
    email = "whatever@example.com"
    password = "password"
    password_confirmation = "password2"
    post "/api/v1/users", params: {email: email, password: password, password_confirmation: password_confirmation}

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:status]).to eq("Account not created. Error occured.")
  end
end