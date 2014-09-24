class Search < ActiveRecord::Base
  has_secure_password
  validates :search, presence: true
end