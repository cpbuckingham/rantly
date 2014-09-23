class Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :rant


  def user_name
    @user = User.find(user_id)
    @user.username
  end


end