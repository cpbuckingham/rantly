class Rant < ActiveRecord::Base
belongs_to :user
has_many :favorites
  validates :title, :content, presence: true
  validates_length_of :content, :minimum => 140
  validates_length_of :title, :maximum => 50
end