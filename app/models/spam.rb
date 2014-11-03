class Spam < ActiveRecord::Base
  belongs_to :rant, :dependent => :destroy
  belongs_to :user


end
