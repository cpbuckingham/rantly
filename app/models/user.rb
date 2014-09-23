class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :bios
  has_many :follows
  validates :username, :first_name, :last_name, :bio, :image, :rant_frequency, presence: true
end