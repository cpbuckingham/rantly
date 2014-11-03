class AdminController < ApplicationController
  before_action :check_if_admin


  def show
    @ranters = User.all
    @rant = Rant.order(:created_at).reverse
    @spams = Spam.all

  end

  def index
    @ranters = User.all
    @rants = @ranters.sort_by { |user| user.rants.count}.reverse
  end
end

private

def check_if_admin
  unless current_user.admin
    redirect_to "/"
  end

end



