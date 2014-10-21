class Rant < ActiveRecord::Base
belongs_to :user
has_many :favorites, dependent: :destroy
has_many :comments, :as => :commentable
validates :title, :content, presence: true
  validates_length_of :content, :minimum => 140
  validates_length_of :title, :maximum => 50

end