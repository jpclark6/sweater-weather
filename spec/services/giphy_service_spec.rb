require 'rails_helper'

describe 'as a giphy service' do
  it 'exists' do
    gif = GiphyService.new(location)
    expect(gif).to be_instance_of(GiphyService)
  end
end