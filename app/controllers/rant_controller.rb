class RantController < ApplicationController
  def new
    @rant = Rant.new
  end

  def index
    @rant = Rant.order(:title)
  end

  def create
    @rant = Rant.new(title: params[:rant][:title],
                     content: params[:rant][:content],
                      rant_id: params[:rant][:rant_id])
    if @rant.save
      flash[:notice] = "Rant created successfully!"
      redirect_to rant_index_path
    else
      @rant.errors
      render :edit
    end
  end

  def edit
    @rant = Rant.find(params[:id])
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(
      title: params[:rant][:title],
      content: params[:rant][:content])
      flash[:notice] = "Your rant was successfully updated!"
      redirect_to rant_index_path
    else
      render :edit
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    flash[:notice] = "Your rant was deleted!"
    redirect_to rant_index_path
  end

  def show
  end
end