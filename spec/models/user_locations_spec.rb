require 'rails_helper'

describe UserLocation do
  describe 'relationships' do
    it { belongs_to :user }
    it { belongs_to :location }
  end
end