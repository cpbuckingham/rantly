class SearchesController < ApplicationController
  def index
    @search = Search.new
  end
end