require 'carrierwave/orm/activerecord'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_authenticated_user
    redirect_to root_path unless current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
  def admin_logged_in?
        session[:admin_id]
  end
  helper_method :current_user
  helper_method :admin_logged_in?
end


