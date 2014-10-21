class CommentsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @comment = @user.comments.new(allowed_params)
    if @comment.save
      redirect_to 'bios/index'
    else
      @bio = Bio.new(@user)
      render 'bios/index'
    end

  end

  private

  def allowed_params
    params.require(:comments).permit(:body, :user_id)
  end


end

