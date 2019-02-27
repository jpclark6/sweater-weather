require 'rails_helper'

describe WeatherLog do
  describe 'validations' do
    it { should validate_uniqueness_of(:lat_lng) }
  end
end