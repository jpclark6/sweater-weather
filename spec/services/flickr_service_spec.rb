require 'rails_helper'

describe 'flickr service' do
  it 'exists' do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)
    expect(flickr).to be_instance_of(FlickrService)
  end
  it 'finds a id for a picture of the city, state' do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)
    id = flickr.find_picture_id
    expect(id.to_i.to_s.length).to be > 1
  end
end