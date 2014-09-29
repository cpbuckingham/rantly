class Search < ActiveRecord::Base
  has_secure_password
  validates_presence_of :search
end

