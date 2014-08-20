class User < ActiveRecord::Base
  has_secure_password

  validates :name, :password, presence: true, uniqueness: true
end