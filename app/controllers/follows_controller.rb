class FollowsController < ApplicationController

  def index
    @user = find_user
    @follows = Follow.where(:user_id => session[:user_id])
  end

  def create
    @user = current_user
    @follow = Follow.new(
      user_id: @user.id,
      follow_id: params[:user_id]
    )
    if @follow.save
      render :nothing => true
    else
      flash[:notice] = "You are already following this ranter"
    end
  end

  def destroy
    @follow = Follow.find_by(:follow_id => params[:user_id], :user_id => current_user.id )
    @follow.destroy
    render :nothing => true
  end

  private

  def find_user
    User.find(params[:user_id])
  end
end