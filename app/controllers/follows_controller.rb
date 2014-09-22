class FollowsController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @follow = Follow.new(
      user_id: @user.id,
      follow_id: params[:id]
    )
    if @follow.save
      redirect_to user_rants_path(@user.id)
    else
      flash[:notice] = "You are already following this ranter"
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to user_rants_path(@user.id)
  end
end