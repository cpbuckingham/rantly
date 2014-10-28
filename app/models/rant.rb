class Rant < ActiveRecord::Base
  belongs_to :user
has_many :spams
has_many :favorites, dependent: :destroy
has_many :comments, :as => :commentable
validates :title, :content, presence: true
  validates_length_of :content, :minimum => 140
  validates_length_of :title, :maximum => 50

  def self.all_except_spam_and_current_user(current_user)
    nonspam_rants = []
    Rant.all.map do |rant|
      nonspam_rants << rant unless Spam.find_by(rant_id: rant.id, user_id: current_user.id) || rant.user_id == current_user.id
    end
    nonspam_rants
  end
end