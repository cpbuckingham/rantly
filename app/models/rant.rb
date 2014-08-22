class Rant < ActiveRecord::Base

  validates :title, :content, presence: true
end