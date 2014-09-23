class FavoritesController < ApplicationController

  def create
    @user = current_user.id
    @favorite = Favorite.new
    @favorite.user_id = @user
    @favorite.rant_id = params[:rant_id]
    @favorite.save!
    redirect_to :back
  end


  def index
    @user = find_user
    @favorites = Favorite.where(:user_id => session[:user_id])
  end

  def destroy
    @user = current_user.id
    @favorite = Favorite.where(id: params[:id], user_id: @user).first
    @favorite.destroy
    redirect_to :back
  end
  private

  def find_user
    User.find(params[:user_id])
  end

end