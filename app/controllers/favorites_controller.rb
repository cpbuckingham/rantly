class FavoritesController < ApplicationController

  def create
    @user = current_user.id
    @favorite = Favorite.new
    @favorite.user_id = @user
    @favorite.rant_id = params[:rant_id]
    @favorite.save!
    render :json => {:favorite_id => @favorite.id}
  end


  def index
    @user = find_user
    @favorites = Favorite.where(:user_id => session[:user_id])
  end

  def destroy
    @user = current_user.id
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    render :nothing => true
  end
  private

  def find_user
    User.find(params[:user_id])
  end

end