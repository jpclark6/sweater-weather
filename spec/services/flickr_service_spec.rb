require 'rails_helper'

describe 'flickr service' do
  it 'exists', :vcr do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)
    expect(flickr).to be_instance_of(FlickrService)
  end
  
  it 'finds a id for a picture of the city, state', :vcr do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)
    id = flickr.find_picture_id
    expect(id.to_i.to_s.length).to be > 1
  end
  
  it 'finds a url for a picture of the city, and state', :vcr do
    city_state = 'denver,co'
    flickr = FlickrService.new(city_state)
    url = flickr.find_picture_url
    expect(url).to include('flickr.com')
  end
  
  it 'finds a url for a picture of a different city, state', :vcr do
    city_state = 'new york,ny'
    flickr = FlickrService.new(city_state)
    url = flickr.find_picture_url
    expect(url).to include('flickr.com')
  end

  it 'caches request if made twice', :vcr do
    city_state = 'new york,ny'
    flickr = FlickrService.new(city_state)
    url_1 = flickr.find_picture_url
    url_2 = flickr.find_picture_url
    expect(url_1).to eq(url_2)
  end
end