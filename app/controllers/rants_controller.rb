class RantsController < ApplicationController
  def new
    @user = find_user
    @rant = Rant.new
  end

  def index
    @user = find_user
    @rant = Rant.order(:title)
  end

  def create
    @user = find_user
    @rant = Rant.new(title: params[:rants][:title],
                     content: params[:rants][:content],
                     user_id: params[:rants][:user_id])
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
    @rant = Rant.find(params[:user_id])
  end

  def update
    @user = find_user
    @rant = Rant.find(params[:user_id])
    if @rant.update(
      title: params[:rants][:title],
      content: params[:rants][:content])
      flash[:notice] = "Your rants was successfully updated!"
      redirect_to user_rants_path
    else
      render :edit
    end
  end

  def destroy
    @user = find_user
    @rant = Rant.find(params[:user_id])
    @rant.destroy
    flash[:notice] = "Your rants was deleted!"
    redirect_to user_rants_path
  end

  def show
  end

  private

  def find_user
    User.find(params[:user_id])
  end

end