class BiosController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @follows = Follow.find_by(:user_id => session[:user_id])
  end

  def check_for_follow(user_id)
    Follow.find_by(
      follow_id: user_id,
      user_id: current_user.id
    )
  end

  helper_method :check_for_follow
end