class UsersController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_rants_path(@user.id)
      flash[:notice] = "Thank you for registering"
    else
      render :new
    end
  end
  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @users.update(user_params)
      redirect_to user_rants_path(params[:id])
      flash[:notice] = "Your profile was successfully updated!"
    else
      render :edit
    end

  end
  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :image, :rant_frequency)
  end
end