class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  validates :username, :password, presence: true, uniqueness: true
end