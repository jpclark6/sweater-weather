require 'rails_helper'

describe 'darksky api' do
  it 'exists' do
    lat_lng = "39.7392358,-104.990251"
    darksky = DarkskyService.new(lat_lng)
    expect(darksky.class).to eq(DarkskyService)
  end
end