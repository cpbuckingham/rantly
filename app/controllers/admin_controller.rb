class AdminController < ApplicationController
  before_action :check_if_admin


  def show
    @ranters = User.all
    @rant = Rant.order(:created_at).reverse
    @spams = Spam.all
    @rants = Rant.all
  end

  def index
    @ranters = User.all
    @rants = @ranters.sort_by { |user| user.rants.count }.reverse
  end

  def impersonate
    session[:admin_id] = current_user.id
    session[:user_id] = params[:user_id]
    redirect_to user_rants_path(current_user)
  end

  def unimpersonate
    puts session[:user_id]
    puts session[:admin_id]
    session[:user_id] = session[:admin_id]
    session.delete(:admin_id)
    redirect_to admin_path(current_user)
  end

  def filter
    @rants = Rant.all

    filter_by_end_date
    filter_by_start_date

    render :show
  end


  private

  def check_if_admin
    unless (current_user.admin or session[:admin_id])
      redirect_to "/"
    end
  end

  def filter_by_start_date
    if params[:start_date] != ''
      date = Date.parse(params[:start_date])

      @rants = @rants.where("created_at > '#{date}'")
    end
  end

  def filter_by_end_date
    if params[:end_date] != ''
      date = Date.parse(params[:end_date])

      @rants = @rants.where("created_at < '#{date}'")
    end
  end
end








