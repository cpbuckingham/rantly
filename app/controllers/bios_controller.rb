class BiosController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @follows = Follow.find_by(:user_id => @user.id)
    @rants = Rant.where(:user_id => @user)
    @rants = @rants.sort_by { |rant| rant.favorites.count}.reverse
  end

  def check_for_follow(user)
    if user.present?
      Follow.find_by(
        follow_id: user.id,
        user_id: current_user.id
      )
    end
  end

  helper_method :check_for_follow
end