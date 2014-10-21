module Users
  class CommentsController < ApplicationController
    def create
      @user = User.find(params[:user_id])
      @comment = @user.comments.new(allowed_params.merge(user_id: params[:user_id]))
      if @comment.save
        redirect_to user_bios_path(@user)
      else
        @bio = Bio.new(@user)
        render '/bios/index'
      end

    end


    private

    def allowed_params
      params.require(:comment).permit(:body)
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
end