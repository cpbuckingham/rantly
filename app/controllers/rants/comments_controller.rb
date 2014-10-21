module Rants
  class CommentsController < ApplicationController
    def create
      @user = User.find_by(params[:user_id])
      @rant = Rant.find(params[:rant_id])
      @rant.comments.create(allowed_params.merge(user_id: params[:user_id]))
      if @rant.comments.save
        @comments = Comment.all
        redirect_to user_rant_path(@user.id, @rant.id)
      else
        @bio = Bio.new(@user)
        render '/rants/show'
      end

    end

    private

    def allowed_params
      params.require(:comment).permit(:body)
    end

  end
end