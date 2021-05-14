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
    @booker = Booker.new
  end

  def create
    @booker = Booker.new(booker_params)
    if @booker.save
      redirect_to ("/bookers/#{@booker.id}") , flash: {success: "Book was successfully created."}
    else
      @bookers = Booker.all
      render :index
    end
  end

  def edit
    @booker = Booker.find(params[:id])
  end

  def update
    @booker = Booker.find(params[:id])
    if @booker.update(booker_params)
      redirect_to ("/bookers/#{@booker.id}"), flash: {success: "Book was successfully update."}
    else
      render :edit
    end
  end

  def destroy
    booker = Booker.find(params[:id])
    booker.destroy
    redirect_to bookers_path(booker), flash: {success: "Book was successfully destroyed."}
  end

  private
  def booker_params
    params.require(:booker).permit(:title, :body)
  end

end
