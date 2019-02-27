# Sweater Weather API

Sweater weather API can be used to get weather data for a location, along with images for that city and weather related gifs. It can also create users in the database and let them create, read, update, and destroy favorite cities.

It is base url is currently hosted at [Sweater Weather](https://sweater-weather-1810.herokuapp.com). Add an endpoint to see functionality.

Example endpoints:
* Weater forecast for city - [GET '/api/v1/forecast?location=denver,co'](https://sweater-weather-1810.herokuapp.com/api/v1/forecast?location=denver,co)

* Background image for city - [GET '/api/v1/forecast?backgrounds=denver,co'](https://sweater-weather-1810.herokuapp.com/api/v1/forecast?backgrounds=denver,co)

* Create user - POST '/api/v1/users?email=joe@example.com&password=password&password_confirmation=password' returns api_key

* Login - POST '/api/v1/sessions?email=joe@example.com&password=password' returns api_key

* Add favorite location - POST '/api/v1/favorites?location=denver,co&api_key=a4a22ffd24c'

* List favorite locations - GET '/api/v1/favorites?api_key=a4a22ffd24c'

* Removing favorite location - DELETE '/api/v1/favorites?location=denver,co&api_key=a4a22ffd24c'

## Prerequisites

You will need Ruby version 2.4 or greater and Rails version 5.2.

To check your version using the terminal, run: `rails -v`.
If you have not installed rails, in terminal, run: `gem install rails -v 5.2`.

## Getting Started

To setup on a local machine please find an appropriate directory and clone down the repo and then run the initial setup using the following commands. Note: it uses Ruby version 2.4.1 and Rails version 5.2.2.


```
git clone https://github.com/jpclark6/sweater-weather
cd sweater-weather
bundle
rake db:{create,migrate}
```

You will also need the following environmental variables sorted in `config/application.yml`. These can be found for free but must be kept private and will not be included.

```
GOOGLE_API_KEY: <gets lat long data from city, state>
DARKSKY_API_KEY: <for forecasts>
FLICKR_API_KEY: <for background image>
GIPHY_API_KEY: <for gifs>
```
Once these are ready you can run the server:
```
rails s
```
Navigate to `localhost:3000`. The application will load to the page. Enjoy!

## Testing

There is a full testing suite for unit and feature tests. The testing suite uses the following tools: 

* [RSpec](https://github.com/rspec/rspec-rails)
* [Capybara](https://github.com/teamcapybara/capybara)
* [SimpleCov](https://github.com/colszowka/simplecov)
* [VCR](https://github.com/vcr/vcr)
* [Webmock](https://github.com/bblimke/webmock)
* [Launchy](https://github.com/copiousfreetime/launchy)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)

To run the full testing suite run this command from the terminal:
```
rspec
```

## Feature Tests

Example feature test:

```
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
```

## Unit Tests

```
describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of :password }
  end
  describe 'relationships' do
    it { should have_many(:user_locations) }
    it { should have_many(:locations).through(:user_locations) }
  end
end
```

## Additional Tools Utilized

* Rails
* PostrgeSQL
* Git control and [GitHub](github.com)
* [Pry](https://github.com/pry/pry)
