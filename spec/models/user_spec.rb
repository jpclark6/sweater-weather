require 'rails_helper'

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