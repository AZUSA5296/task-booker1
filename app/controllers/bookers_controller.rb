class BookersController < ApplicationController

  def top
  end

  def index
     @booker = Booker.new
     @bookers = Booker.all
  end

  def show
    @booker = Booker.find(params[:id])
  end

  def new
  end

  def create
    booker = Booker.new(booker_params)
    booker.save
    redirect_to bookers_path(booker.id)
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    booker = Booker.find(params[:id])
    booker.update(booker_params)
    redirect_to booker_path(booker)
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    redirect_to bookers_path(booker)
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end

end
