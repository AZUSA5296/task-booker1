class BookersController < ApplicationController

  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to "/bookers/#{@book.id}" , flash: {success: "Book was successfully created."}
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to booker_path, flash: {success: "Book was successfully update."}
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to bookers_path, flash: {success: "Book was successfully destroyed."}
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
