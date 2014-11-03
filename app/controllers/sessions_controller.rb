class SessionsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      if @user.email_is_confirmed? && @user.disabled == false
        session[:user_id] = @user.id
        Keen.publish(:logins, {username: @user.username, login_date: DateTime.now()})
        redirect_to user_rants_path(@user.id)
      elsif @user.email_is_confirmed? && @user.disabled == true
        flash.now[:notice] = "Your account as been disabled"
        render :new
      else
        @user = User.new
        flash.now[:notice] = "You must confirm your email prior to logging in.  Please see your confirmation email and follow the instructions."
        render :new
      end
    else
      @user = User.new
      flash.now[:notice] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end



