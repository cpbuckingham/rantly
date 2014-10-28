class SessionsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      if @user.email_is_confirmed?
        session[:user_id] = @user.id
        redirect_to user_rants_path(@user.id)
      else
        flash.now[:notice] = "You must confirm your email prior to logging in.  Please see your confirmation email and follow the instructions."
        render :new
      end
    else
      flash.now[:notice] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end



