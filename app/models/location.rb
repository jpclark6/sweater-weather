class Location < ApplicationRecord
  validates_uniqueness_of :city_state

  has_many :user_locations
  has_many :users, through: :user_locations
end