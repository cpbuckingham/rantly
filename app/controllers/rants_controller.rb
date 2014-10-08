class RantsController < ApplicationController
  def new
    @user = find_user
    @rant = Rant.new
  end

  def show
    @user = find_user
    @rant = Rant.find(params[:id])
  end

  def index
    @rant = Rant.new
    @user = find_user
    @latest_rant = Rant.order(:created_at).reverse_order.limit(3).where("user_id <> #{current_user.id}")
    @rants = Rant.where(:user_id => session[:user_id])
    @follows = Follow.where(:user_id => session[:user_id])
    @mentioned = Rant.where('content LIKE ?',"%@"+"#{current_user.username}"+"%")
  end

  def create
    @user = find_user
    @rant = Rant.new(title: params[:rant][:title],
                     content: params[:rant][:content],
                     user_id: params[:user_id])
    if @rant.save
      flash[:notice] = "Rant created successfully!"
      redirect_to user_rants_path(@user.id)
    else
      @rant.errors
      render :new
    end
  end

  def edit
    @user = find_user
    @rant = Rant.find(params[:id])
  end

  def update
    @user = find_user
    @rant = Rant.find(params[:id])
    if @rant.update(
      title: params[:rant][:title],
      content: params[:rant][:content])
      flash[:notice] = "Your rants was successfully updated!"
      redirect_to user_rants_path(@user.id)
    else
      @rant.errors
      render :edit
    end
  end

  def destroy
    @user = find_user
    @rant = Rant.find(params[:id])
    @rant.destroy
    flash[:notice] = "Your rants was deleted!"
    redirect_to user_rants_path(@user.id)
  end

  private

  def find_user
    User.find(params[:user_id])
  end
  def check_for_follow(user)
    if user.present?
      Follow.find_by(
        follow_id: user.id,
        user_id: current_user.id
      )
    end
  end

  helper_method :check_for_follow
end