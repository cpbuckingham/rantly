class SearchesController < ApplicationController
    def index
      params[:search] ||= "alskdfjlakjsdfihoqw}}KQEPifj"
      @rants = Rant.joins(:user).where('username LIKE ? OR first_name LIKE ? OR last_name LIKE ?', params[:search]+"%",params[:search]+"%",params[:search]+"%")
      @rant = Rant.where('title LIKE ?', params[:search]+"%")
      @contents = Rant.where('content LIKE ?', params[:search]+"%")
      @mentioned = User.where('content LIKE ?', params[:search]+"@%")
    end
end
