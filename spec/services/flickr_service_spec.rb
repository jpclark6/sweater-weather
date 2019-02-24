require 'rails_helper'

describe 'flickr service' do
  it 'exists' do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)
    expect(flickr).to be_instance_of(FlickrService)

  end
end