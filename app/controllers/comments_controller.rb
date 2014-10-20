class CommentsController < ApplicationController

  def create
    @comment = Comment.create(body: params[:comment][:body], user_id: params[:user_id])
    @comments = Comment.all
    redirect_to :back
  end

end