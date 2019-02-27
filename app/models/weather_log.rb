class WeatherLog < ApplicationRecord
  validates_uniqueness_of :lat_lng
end