class AdminController < ApplicationController
  before_action :check_if_admin


  def show
    @ranters = User.all
    @rant = Rant.order(:created_at).reverse
    @spams = Spam.all

  end

  def index
    @ranters = User.all
    @rants = @ranters.sort_by { |user| user.rants.count}.reverse
  end

def impersonate
  session[:admin_id] = current_user.id
  session[:user_id] = params[:user_id]
  redirect_to user_rants_path(:user_id)
end

def unimpersonate
  session[:user_id] = session[:admin_id]
  session.delete(:admin_id)
  redirect_to admin_path(current_user.id)
end
end

private

def check_if_admin
  unless current_user.admin
    redirect_to "/"
  end
  end






