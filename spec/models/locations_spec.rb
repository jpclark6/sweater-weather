require 'rails_helper'

describe Location do
  describe 'validations' do
    it { should validate_uniqueness_of(:city_state) }
  end
  describe 'relationships' do
    it { should have_many(:user_locations) }
    it { should have_many(:users).through(:user_locations) }
  end
end