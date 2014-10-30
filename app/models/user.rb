class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_many :spams
  has_many :bios
  has_many :follows
  has_many :comments, :as => :commentable
  mount_uploader :avatar, AvatarUploader
  validates :username, :first_name, :password_digest, :last_name, :bio, :email, presence: true
  validates :username, uniqueness: true
end