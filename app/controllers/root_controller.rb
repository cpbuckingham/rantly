class RootController < ApplicationController
 def index
    if cookies[:anonymous_user].present? && current_user.nil?
      flash[:notice] = "Welcome Back"
    else
      cookies[:anonymous_user] = "Andrew"
    end
 end
end