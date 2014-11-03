class Spam < ActiveRecord::Base
  belongs_to :rant
  belongs_to :user


end
