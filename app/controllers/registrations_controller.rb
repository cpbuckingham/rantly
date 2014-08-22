class RegistrationsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      password: params[:user][:password],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      bio: params[:user][:bio],
      rant_frequency: params[:user][:rant_frequency]
    )
    if @user.save
      redirect_to root_path
      flash[:notice] = "Thank you for registering"
    else
      flash[:notice] = "Your account could not be created"
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(
      username: params[:user][:username],
      password: params[:user][:password],
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      bio: params[:user][:bio],
      rant_frequency: params[:user][:rant_frequency])
      redirect_to rant_index_path
      flash[:notice] = "Your profile was successfully updated!"
    else
      render :edit
    end
  end
end