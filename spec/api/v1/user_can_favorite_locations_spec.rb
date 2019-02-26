require 'rails_helper'

describe 'as a user' do
  it 'can favorite locations' do
    email = 'example@example.com'
    password = 'password'
    api_key = 'abc123'
    user = User.create(email: email, password: password, api_key: api_key)

    post "/api/v1/favorites?api_key=#{api_key}"

    expect(response).to be_successful
    data = JSON.parse(response.body, symbolize_names: true)
    

    POST /api/v1/favorites
Content-Type: application/json
Accept: application/json

body:

{
  "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
  end
end