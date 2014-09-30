class Rant < ActiveRecord::Base
belongs_to :user
has_many :favorites
  validates :title, :content, presence: true
end