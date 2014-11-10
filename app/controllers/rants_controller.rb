class RantsController < ApplicationController

  def new
    @user = find_user
    @rant = Rant.new
  end

  def show
    @comment = Comment.new
    @user = find_user
    @rant = Rant.find(params[:id])
    @comments = Comment.where(:commentable_id => @rant.id).sort_by do |comment|
      comment[:created_at]
    end.reverse
  end

  def index
    @rant = Rant.new
    @user = find_user
    @latest_rant = Rant.all_except_spam_and_current_user(current_user)
    @rants = Rant.where(:user_id => session[:user_id])
    @follows = Follow.where(:user_id => session[:user_id])
    @mentioned = Rant.where('content LIKE ?', "%@"+"#{current_user.username}"+"%")
  end

  def create
    @user = find_user
    @rant = Rant.new(title: params[:rant][:title],
                     content: params[:rant][:content],
                     user_id: params[:user_id])

    if @rant.save
      flash[:notice] = "Rant created successfully!"
      if @user.follows != nil
        @user.follows.map do |follow|
          UserMailer.follow_ranted_email(follow.user.email, @rant).deliver
        end
      end
      render :nothing => true
    else
      errors = @rant.errors.full_messages
      render :json => {errors: errors}
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
    flash[:notice] = "Rant was deleted!"
    redirect_to :back
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
