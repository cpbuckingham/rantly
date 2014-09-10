class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  validates :username, :password, :first_name, presence: true, uniqueness: true
end