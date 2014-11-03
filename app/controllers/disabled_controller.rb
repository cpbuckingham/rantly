class DisabledController < ApplicationController

  def update
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, params[:disabled])
    @user.save!
    redirect_to :back
  end

end