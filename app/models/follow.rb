class Follow < ActiveRecord::Base

  belongs_to :user, foreign_key: :follow_id



end