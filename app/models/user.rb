class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :bios
  has_many :follows
  validates :username, :password, :first_name, presence: true, uniqueness: true
end