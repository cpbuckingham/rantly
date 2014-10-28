class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :spams
  has_many :bios
  has_many :follows
  has_many :comments, :as => :commentable
  validates :username, :first_name, :last_name, :bio, :email, :image, presence: true
  validates :username, uniqueness: true
end