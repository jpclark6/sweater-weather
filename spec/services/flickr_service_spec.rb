require 'rails_helper'

describe 'flickr service' do
  it 'exists' do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)

  end
end