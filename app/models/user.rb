class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :password, if: :password
  validates_uniqueness_of :email, :api_key
  validates_confirmation_of :password

  has_secure_password
end