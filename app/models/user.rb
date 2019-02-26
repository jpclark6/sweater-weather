class User < ApplicationRecord
  validates_presence_of :email, :password
  validates_uniqueness_of :email, :api_key
  validates_confirmation_of :password

  has_many :user_locations
  has_many :locations, through: :user_locations

  has_secure_password
end