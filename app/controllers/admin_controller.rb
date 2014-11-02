class AdminController < ApplicationController
  before_action :check_if_admin


  def show
    @ranters = User.all
    @rant = Rant.order(:created_at).reverse
  end
end

private

def check_if_admin
  unless current_user.admin
    redirect_to "/"
  end

end



