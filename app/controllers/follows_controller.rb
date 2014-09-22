class FollowsController < ApplicationController

  def index
    @user = find_user
    @follows = Follow.where(:user_id => session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @follow = Follow.new(
      user_id: @user.id,
      follow_id: params[:id]
    )
    if @follow.save
      redirect_to user_follows_path
    else
      flash[:notice] = "You are already following this ranter"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.find_by(:follow_id => params[:id])
    @follow.destroy
    redirect_to user_follows_path
  end
  
  private

  def find_user
    User.find(params[:user_id])
  end
end