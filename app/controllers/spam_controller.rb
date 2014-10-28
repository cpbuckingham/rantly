class SpamController < ApplicationController

  def create
    @user = current_user
    @spam = Spam.new(rant_id: params[:id], user_id: current_user.id)
    if @spam.save
      flash[:notice] = "Rant marked as spam"
      redirect_to user_rants_path(@user.id)
    end
  end
end
