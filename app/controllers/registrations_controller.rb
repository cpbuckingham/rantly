class RegistrationsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      password: params[:user][:password]
    )

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end