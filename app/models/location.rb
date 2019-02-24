class Location < ApplicationRecord
  validates_uniqueness_of :city_state
end