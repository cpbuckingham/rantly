class SessionsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.new(name: params[:user][:name])
      @user.errors[:base] << "Username / password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end