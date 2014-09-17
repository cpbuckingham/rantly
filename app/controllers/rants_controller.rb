class RantsController < ApplicationController
  def new
    @user = find_user
    @rant = Rant.new
  end

  def index
    @user = find_user
    @rant = Rant.order(:created_at).reverse_order.limit(3)
    @rants = Rant.where(:user_id => session[:user_id])
    @follows = Follow.all
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
      render :edit
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

end