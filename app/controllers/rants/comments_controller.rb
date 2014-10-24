module Rants
  class CommentsController < ApplicationController
    def create
      @user = User.find_by(params[:user_id])
      @rant = Rant.find(params[:rant_id])
      @comments = @rant.comments.create(allowed_params.merge(:user_id => current_user.id))
      if @comments.save
        redirect_to :back
      else
        render '/rants/show'
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