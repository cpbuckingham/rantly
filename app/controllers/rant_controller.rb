class RantController < ApplicationController

  def index
    @rant = Rant.order(:title)
  end

  def edit
    @rant = Rant.new
  end

  def create
    @rant = Rant.create(title: params[:rant][:title])

    if @rant.valid?
      flash[:notice] = "Rant created successfully!"
      redirect_to root_path
    else
      @rant.errors
      render :edit
    end
  end

  def new
    @rant = Rant.find(params[:id])
  end

  def update
    @rant = Rant.find(params[:id])
    if @rant.update(
      name: params[:task_list][:name]
    )
      flash[:notice] = "Your rant was successfully updated!"
      redirect_to root_path
    else
      render :new
    end
  end
  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to root_path
  end
  def show
  end
end